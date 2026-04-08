import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

class ChapterSpeech {
  late final String id;
  final String bookId;
  final String chapterId;
  final TtsVoice voice;
  final List<ChapterSpeechChunk> chunks;

  ChapterSpeech({
    required this.bookId,
    required this.chapterId,
    required this.voice,
    required this.chunks,
  }) {
    id = generateId(
      bookId: bookId,
      chapterId: chapterId,
      voiceIdentifier: voice.identifier,
    );
  }

  static String generateId({
    required String bookId,
    required String chapterId,
    required String voiceIdentifier,
  }) {
    return '$bookId::$chapterId::$voiceIdentifier';
  }

  @override
  String toString() {
    return 'ChapterSpeech{id: $id, bookId: $bookId, chapterId: $chapterId, voice: $voice, chunks.length: ${chunks.length}}';
  }


}

class ChapterSpeechChunk {
  final String id;
  final int order;
  final String text;
  final String label;
  final String localPath;
  final bool isReady;

  const ChapterSpeechChunk({
    required this.id,
    required this.order,
    required this.text,
    required this.label,
    this.localPath = '',
    this.isReady = false,
  });
}

class ChapterSpeechChunkMapper {
  static List<ChapterSpeechChunk> mapFromContent(
    ChapterContentModel content, {
    required Gender gender
  }) {
    final chunks = <ChapterSpeechChunk>[];
    var order = 0;

    void addChunk({
      required String id,
      required String label,
      required String text,
    }) {
      final normalized = _normalize(text);
      if (normalized.isEmpty) return;

      chunks.add(
        ChapterSpeechChunk(
          id: id,
          order: order++,
          label: label,
          text: normalized,
        ),
      );
    }

    for (var i = 0; i < content.sections.length; i++) {
      final section = content.sections[i];

      addChunk(
        id: 'section_${i}_title_body',
        label: section.title,
        text: '${section.title}. ${section.body}',
      );
    }

    if (content.keyTerms.isNotEmpty) {
      for (var i = 0; i < content.keyTerms.length; i++) {
        final term = content.keyTerms[i];
        addChunk(
          id: 'key_term_$i',
          label: 'Key term: ${term.term}',
          text: '${term.term}. ${term.definition}',
        );
      }
    }

    addChunk(
      id: 'the_move',
      label: 'The Move',
      text: 'The Move. ${content.theMove}',
    );

    addChunk(
      id: 'insider_detail',
      label: 'Insider Detail',
      text: 'Insider Detail. ${content.insiderDetail}',
    );

    switch(gender) {

      case Gender.male:
        addChunk(
          id: 'gender_note_men',
          label: 'For Men',
          text: 'For Men. ${content.genderNoteForMen}',
        );
      case Gender.female:
        addChunk(
          id: 'gender_note_women',
          label: 'For Women',
          text: 'For Women. ${content.genderNoteForWomen}',
        );
      case Gender.nonbinary:

    }

    if (content.cheatSheet.isNotEmpty) {
      for (var i = 0; i < content.cheatSheet.length; i++) {
        addChunk(
          id: 'cheat_sheet_$i',
          label: 'Cheat Sheet ${i + 1}',
          text: content.cheatSheet[i],
        );
      }
    }

    return chunks;
  }

  static String _normalize(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
