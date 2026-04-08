import 'package:isar_community/isar.dart';

part 'chapter_speech_isar.g.dart';

@collection
class ChapterSpeechIsar {
  Id isarId = Isar.autoIncrement;

  @Index()
  late String bookId;

  @Index()
  late String chapterId;

  @Index()
  late String voiceId;

  @Index(unique: true, replace: true)
  late String uniqueKey;
}