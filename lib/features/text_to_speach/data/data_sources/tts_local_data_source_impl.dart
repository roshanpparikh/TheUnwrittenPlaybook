import 'package:flutter/cupertino.dart';
import 'package:isar_community/isar.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/data_sources/chapter_speech_chunk_isar.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/data_sources/chapter_speech_isar.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/models/chapter_speech_model.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'tts_local_data_source.dart';

class TtsLocalDataSourceImpl implements TtsLocalDataSource {
  final Isar _isar;

  TtsLocalDataSourceImpl(this._isar);

  IsarCollection<ChapterSpeechIsar> get _speechCol => _isar.chapterSpeechIsars;
  IsarCollection<ChapterSpeechChunkIsar> get _chunkCol => _isar.chapterSpeechChunkIsars;

  @override
  Future<ChapterSpeech?> getChapterSpeech({
    required String bookId,
    required String chapterId,
    required String voice,
  }) async {
    final key = ChapterSpeech.generateId(
      bookId: bookId,
      chapterId: chapterId,
      voiceIdentifier: voice,
    );

    debugPrint(
      'getChapterSpeech(bookId: $bookId, chapterId: $chapterId, voice: $voice, key: $key)',
    );

    final speechRecord = await _speechCol
        .filter()
        .uniqueKeyEqualTo(key)
        .findFirst();

    if (speechRecord == null) return null;

    final chunkRecords = await _chunkCol
        .filter()
        .speechIdEqualTo(key)
        .sortByOrder()
        .findAll();

    final model = ChapterSpeechModel.fromIsar(
      speechRecord,
      chunkRecords: chunkRecords,
    );
    if (model == null) return null;

    return ChapterSpeech(
      bookId: model.bookId,
      chapterId: model.chapterId,
      voice: model.voice,
      chunks: model.chunks
          .map(
            (c) => ChapterSpeechChunk(
          id: c.chunkId,
          order: c.order,
          text: c.text,
          label: c.label,
          localPath: c.localPath,
          isReady: c.isReady,
        ),
      )
          .toList(),
    );
  }

  @override
  Future<ChapterSpeechChunk?> getChunk({
    required String speechId,
    required String chunkId,
  }) async {
    final chunkRecord = await _chunkCol
        .filter()
        .uniqueKeyEqualTo('$speechId::$chunkId')
        .findFirst();
    if (chunkRecord == null) return null;

    return ChapterSpeechChunk(
      id: chunkRecord.chunkId,
      order: chunkRecord.order,
      text: chunkRecord.text,
      label: chunkRecord.label,
      localPath: chunkRecord.localPath,
      isReady: chunkRecord.isReady,
    );
  }

  @override
  Future<void> saveChapterSpeech(ChapterSpeech speech) async {
    debugPrint("saveChapterSpeech: $speech");
    final speechModel = ChapterSpeechModel.fromEntity(speech);

    final speechIsar = speechModel.toIsar();
    final chunkIsars = speechModel.toChunkIsarList();

    await _isar.writeTxn(() async {
      await _speechCol.put(speechIsar);

      final oldChunks = await _chunkCol
          .filter()
          .speechIdEqualTo(speech.id)
          .findAll();

      if (oldChunks.isNotEmpty) {
        await _chunkCol.deleteAll(oldChunks.map((e) => e.isarId).toList());
      }

      if (chunkIsars.isNotEmpty) {
        await _chunkCol.putAll(chunkIsars);
      }
    });
  }

  @override
  Future<void> saveChunk({
    required String bookId,
    required String chapterId,
    required String speechId,
    required ChapterSpeechChunk chunk,
  }) async {
    final chunkIsar = ChapterSpeechChunkIsar()
      ..label = chunk.label
      ..chapterId = chapterId
      ..bookId = bookId
      ..speechId = speechId
      ..order = chunk.order
      ..uniqueKey = '$speechId::${chunk.id}'
      ..chunkId = chunk.id
      ..label = chunk.label
      ..text = chunk.text
      ..localPath = chunk.localPath
      ..isReady = chunk.isReady;

    await _isar.writeTxn(() async {
      await _chunkCol.put(chunkIsar);
    });
  }

  @override
  Future<void> deleteChapterSpeech({
    required String bookId,
    required String chapterId,
    required String voice,
  }) async {
    final speechId = ChapterSpeech.generateId(
      bookId: bookId,
      chapterId: chapterId,
      voiceIdentifier: voice,
    );

    final speechRecord = await _speechCol
        .filter()
        .uniqueKeyEqualTo(speechId)
        .findFirst();

    final chunkRecords = await _chunkCol
        .filter()
        .speechIdEqualTo(speechId)
        .findAll();

    await _isar.writeTxn(() async {
      if (chunkRecords.isNotEmpty) {
        await _chunkCol.deleteAll(chunkRecords.map((e) => e.isarId).toList());
      }

      if (speechRecord != null) {
        await _speechCol.delete(speechRecord.isarId);
      }
    });
  }

  @override
  Future<List<ChapterSpeech>> getAllChapterSpeeches({
    String? bookId,
    String? voiceIdentifier,
  }) async {
    final speechRecords = await _speechCol.where().findAll();
    debugPrint("speechRecords: ${speechRecords.length}");
    final result = <ChapterSpeech>[];

    for (final speechRecord in speechRecords) {
      final chunkRecords = await _chunkCol
          .filter()
          .speechIdEqualTo(speechRecord.uniqueKey)
          .sortByOrder()
          .findAll();

      final speech = ChapterSpeechModel.fromIsar(
        speechRecord,
        chunkRecords: chunkRecords,
      );

      if (speech == null) continue;

      final matchesBookId = bookId == null || speech.bookId == bookId;
      final matchesVoice =
          voiceIdentifier == null || speech.voice.identifier == voiceIdentifier;

      if (matchesBookId && matchesVoice) {
        result.add(
          ChapterSpeech(
            bookId: speech.bookId,
            chapterId: speech.chapterId,
            voice: speech.voice,
            chunks: speech.chunks
                .map(
                  (c) => ChapterSpeechChunk(
                id: c.chunkId,
                order: c.order,
                text: c.text,
                label: c.label,
                localPath: c.localPath,
                isReady: c.isReady,
              ),
            )
                .toList(),
          ),
        );
      }
    }

    return result;
  }
}