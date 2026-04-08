import 'package:upwork_the_unwritten_playbook/data/dto/tip_dto.dart';

abstract class RemoteTipSource {
  /// Generate 4 tips based on [chapterContent].
  Future<List<TipDto>> generateTips(String chapterText);
}
