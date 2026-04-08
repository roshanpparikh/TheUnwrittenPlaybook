class ChapterModel {
  final int number;
  final String title;
  final String partId;
  final List<String> interests;
  final bool alwaysInclude;
  final int readTime;
  final bool faithOnly;
  final bool parentOnly;

  const ChapterModel({
    required this.number,
    required this.title,
    required this.partId,
    this.interests = const [],
    this.alwaysInclude = false,
    required this.readTime,
    this.faithOnly = false,
    this.parentOnly = false,
  });
}
