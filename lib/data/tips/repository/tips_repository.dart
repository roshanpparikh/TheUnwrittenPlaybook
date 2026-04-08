import 'package:flutter/foundation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';

abstract class TipsRepository {
  ValueListenable<List<TipModel>> get tips;

  /// Loads cached tips and generates new ones if needed.
  Future<void> init(int? lastChapterId, String? chapterContent);
}
