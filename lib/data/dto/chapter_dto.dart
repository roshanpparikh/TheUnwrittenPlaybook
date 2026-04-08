import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';

class ChapterDto {
  final int number;
  final String title;
  final String partId;
  final List<String> interests;
  final bool alwaysInclude;
  final int readTime;
  final bool faithOnly;
  final bool parentOnly;

  const ChapterDto({
    required this.number,
    required this.title,
    required this.partId,
    this.interests = const [],
    this.alwaysInclude = false,
    required this.readTime,
    this.faithOnly = false,
    this.parentOnly = false,
  });

  factory ChapterDto.fromJson(Map<String, dynamic> json) {
    return ChapterDto(
      number: (json['number'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      partId: json['partId'] as String? ?? '',
      interests: (json['interests'] as List?)?.whereType<String>().toList() ?? const [],
      alwaysInclude: json['alwaysInclude'] as bool? ?? false,
      readTime: (json['readTime'] as num?)?.toInt() ?? 0,
      faithOnly: json['faithOnly'] as bool? ?? false,
      parentOnly: json['parentOnly'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'number': number,
        'title': title,
        'partId': partId,
        if (interests.isNotEmpty) 'interests': interests,
        if (alwaysInclude) 'alwaysInclude': alwaysInclude,
        'readTime': readTime,
        if (faithOnly) 'faithOnly': faithOnly,
        if (parentOnly) 'parentOnly': parentOnly,
      };

  ChapterModel toModel() => ChapterModel(
        number: number,
        title: title,
        partId: partId,
        interests: interests,
        alwaysInclude: alwaysInclude,
        readTime: readTime,
        faithOnly: faithOnly,
        parentOnly: parentOnly,
      );
}
