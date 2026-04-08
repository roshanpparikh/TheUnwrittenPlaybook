import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/isar/tip_isar.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/data_sources/chapter_speech_chunk_isar.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/data_sources/chapter_speech_isar.dart';

import 'app_seed_state_isar.dart';
import 'chat_message_isar.dart';
import 'embedded_chunk_isar.dart';

class AppIsar {
  static Isar? _instance;

  static Future<Isar> instance() async {
    if (_instance != null) {
      return _instance!;
    }

    final dir = await getApplicationSupportDirectory();

    _instance = await Isar.open(
      [
        EmbeddedChunkIsarSchema,
        AppSeedStateIsarSchema,
        ChatMessageIsarSchema,
        ChapterSpeechIsarSchema,
        ChapterSpeechChunkIsarSchema,
        TipIsarSchema,
      ],
      directory: dir.path,
      name: 'book_embeddings',
      inspector: false,
    );

    return _instance!;
  }
}
