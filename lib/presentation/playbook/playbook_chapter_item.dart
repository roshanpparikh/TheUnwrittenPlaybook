import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';

class PlaybookChapterItem {
  final ChapterModel chapter;
  final String? badge; // 'Priority' | 'New' | null

  const PlaybookChapterItem({required this.chapter, this.badge});
}