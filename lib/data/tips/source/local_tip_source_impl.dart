import 'package:isar_community/isar.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/isar/tip_isar.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';

import 'local_tip_source.dart';

class LocalTipSourceImpl implements LocalTipSource {
  final Isar _isar;

  const LocalTipSourceImpl(this._isar);

  @override
  Future<List<TipModel>> loadTips() async {
    final records = await _isar.tipIsars.where().findAll();
    return records
        .map((r) => TipModel(
        generatedAtMs: r.generatedAtMs,
        forChapterId: r.forChapterId,
        type: TipType.values.byName(r.type) ,
        label: r.label, content: r.content))
        .toList();
  }

  @override
  Future<void> saveTips(
    List<TipModel> tips) async {
    final records = tips.map((t) {
      final r = TipIsar()
        ..type = t.type.name
        ..label = t.label
        ..content = t.content
        ..generatedAtMs = t.generatedAtMs
        ..forChapterId = t.forChapterId;
      return r;
    }).toList();

    await _isar.writeTxn(() async {
      await _isar.tipIsars.clear();
      await _isar.tipIsars.putAll(records);
    });
  }
}
