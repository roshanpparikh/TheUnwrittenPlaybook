import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';

class ChapterSectionDto {
  final String title;
  final String body;

  const ChapterSectionDto({required this.title, required this.body});


  ChapterSectionModel toModel() => ChapterSectionModel(
        title: title,
        body: body,
      );
}

class KeyTerm {
  final String term;
  final String definition;

  const KeyTerm({required this.term, required this.definition});


  KeyTermModel toModel() => KeyTermModel(
        term: term,
        definition: definition,
      );
}

class ChapterContentDto {
  final List<ChapterSectionDto> sections;
  final List<KeyTerm> keyTerms;
  final String theMove;
  final String insiderDetail;
  final String genderNoteForMen;
  final String genderNoteForWomen;
  final List<String> cheatSheet;

  const ChapterContentDto({
    required this.sections,
    required this.keyTerms,
    required this.theMove,
    required this.insiderDetail,
    required this.genderNoteForMen,
    required this.genderNoteForWomen,
    required this.cheatSheet,
  });

  factory ChapterContentDto.fromMap(Map<String, dynamic> map) {
    final rawSections = (map['s'] as List?)?.cast<Map>() ?? [];
    final rawKeyTerms = (map['k'] as List?)?.cast<Map>() ?? [];

    return ChapterContentDto(
      sections: rawSections
          .map((s) => ChapterSectionDto(
                title: s['t'] as String? ?? '',
                body: s['b'] as String? ?? '',
              ))
          .toList(),
      keyTerms: rawKeyTerms
          .map((k) => KeyTerm(
                term: k['t'] as String? ?? '',
                definition: k['d'] as String? ?? '',
              ))
          .toList(),
      theMove: map['m'] as String? ?? '',
      insiderDetail: map['i'] as String? ?? '',
      genderNoteForMen: map['gm'] as String? ?? '',
      genderNoteForWomen: map['gf'] as String? ?? '',
      cheatSheet: (map['ch'] as List?)?.cast<String>() ?? [],
    );
  }

   ChapterContentModel toModel() => ChapterContentModel(
        sections: sections.map((s) => s.toModel()).toList(),
        keyTerms: keyTerms.map((k) => k.toModel()).toList(),
        theMove: theMove,
        insiderDetail: insiderDetail,
        genderNoteForMen: genderNoteForMen,
        genderNoteForWomen: genderNoteForWomen,
        cheatSheet: cheatSheet,
      );
}
