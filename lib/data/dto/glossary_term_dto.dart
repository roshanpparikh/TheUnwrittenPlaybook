import '../glossary_data.dart';

class GlossaryTermDto {
  final String title;
  final String definition;
  final String chapter;

  GlossaryTermDto({
    required this.title,
    required this.definition,
    required this.chapter,
  });

  factory GlossaryTermDto.fromJson(Map<String, dynamic> json) {
    return GlossaryTermDto(
      title: json['title'] as String,
      definition: json['definition'] as String,
      chapter: json['chapter'] as String,
    );
  }

  GlossaryTerm toModel() => GlossaryTerm(
        title: title,
        definition: definition,
        chapter: chapter,
      );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'definition': definition,
      'chapter': chapter,
    };
  }
}