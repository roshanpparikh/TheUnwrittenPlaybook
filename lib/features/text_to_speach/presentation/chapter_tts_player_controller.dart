import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/cubit/chapter_tts_cubit.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/cubit/chapter_tts_state.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

class ChapterTtsPlayerController {
  final ChapterTtsCubit cubit;

  final String bookId;
  final String chapterId;

  final TtsVoice voice;

  ChapterTtsPlayerController({
    required this.cubit,
    required this.bookId,
    required this.chapterId,
    required this.voice,
  });

  Stream<ChapterTtsState> get stream => cubit.stream;
  ChapterTtsState get state => cubit.state;

  Future<void> initialize(ChapterContentModel content, Gender userGender) {
    return cubit.loadOrGenerate(
      bookId: bookId,
      chapterId: chapterId,
      content: content,
      voice: voice, userGender: userGender,
    );
  }


  Future<void> play() => cubit.play();
  Future<void> pause() => cubit.pause();
  Future<void> stop() => cubit.stop();
  Future<void> seek(Duration position) => cubit.seek(position);
}