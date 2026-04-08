import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';

import '../../data/glossary_data.dart';
import '../../data/quiz_data.dart';
import '../models/chapter_content_model.dart';
import '../models/playbook_part.dart';

abstract class BookRepository {
  Future<List<ChapterModel>> getChapters();

  Future<ChapterContentModel?> getChapterContent(int chapterNumber);

  List<PlaybookPart> getParts();

  Future<List<GlossaryTerm>> getGlossaryTerms();

  List<QuizQuestion> getQuizQuestions();
}
