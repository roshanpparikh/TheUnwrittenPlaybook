enum TipType {
  tip, insight, wisdom, keyPrinciple;

  String get title => switch(this) {

    TipType.tip => "Tip",

    TipType.insight => "Insight",

    TipType.wisdom => "Wisdom",

    TipType.keyPrinciple => "Key Principle",
  };
}

class TipModel {
  final TipType type;
  final String label;
  final String content;
  final int generatedAtMs;
  final int forChapterId;

  TipModel({
    required this.type,
    required this.label,
    required this.content,
    required this.generatedAtMs,
    required this.forChapterId
  });
}