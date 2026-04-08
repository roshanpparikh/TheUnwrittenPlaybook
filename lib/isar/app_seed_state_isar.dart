import 'package:isar_community/isar.dart';

part 'app_seed_state_isar.g.dart';

@collection
class AppSeedStateIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String key;

  String? value;
}