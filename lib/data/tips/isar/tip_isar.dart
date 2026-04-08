import 'package:isar_community/isar.dart';

part 'tip_isar.g.dart';

@collection
class TipIsar {
  Id isarId = Isar.autoIncrement;

  late String type;
  late String label;
  late String content;

  /// Epoch ms — when this batch of tips was generated
  @Index()
  late int generatedAtMs;

  /// The chapter number that triggered this generation
  @Index()
  late int forChapterId;
}
