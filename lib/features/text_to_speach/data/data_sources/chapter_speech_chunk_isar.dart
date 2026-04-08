import 'package:isar_community/isar.dart';

part 'chapter_speech_chunk_isar.g.dart';

@collection
class ChapterSpeechChunkIsar {
  Id isarId = Isar.autoIncrement;

  @Index()
  late String bookId;

  @Index()
  late String chapterId;

  @Index()
  late String speechId;

  @Index()
  late int order;

  @Index(unique: true, replace: true)
  late String uniqueKey;

  late String chunkId;
  late String label;
  late String text;
  late String localPath;
  late bool isReady;
}