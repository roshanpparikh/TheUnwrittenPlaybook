import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';

abstract class LocalTipSource {
  Future<List<TipModel>> loadTips();

  Future<void> saveTips(
    List<TipModel> tips);
}
