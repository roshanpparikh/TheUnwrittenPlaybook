class ChapterSectionModel {
  final String title;
  final String body;

  const ChapterSectionModel({required this.title, required this.body});
}

class KeyTermModel {
  final String term;
  final String definition;

  const KeyTermModel({required this.term, required this.definition});
}

class ChapterContentModel {
  final List<ChapterSectionModel> sections;
  final List<KeyTermModel> keyTerms;
  final String theMove;
  final String insiderDetail;
  final String genderNoteForMen;
  final String genderNoteForWomen;
  final List<String> cheatSheet;

  const ChapterContentModel({
    required this.sections,
    required this.keyTerms,
    required this.theMove,
    required this.insiderDetail,
    required this.genderNoteForMen,
    required this.genderNoteForWomen,
    required this.cheatSheet,
  });
}
