import 'package:upwork_the_unwritten_playbook/isar/embedded_chunk_isar.dart';

class RetrievedChunk {
  final String chunkId;
  final String chapterId;
  final String? chapterTitle;
  final String kind;
  final String? sectionTitle;
  final int? order;
  final String text;

  RetrievedChunk({
    required this.chunkId,
    required this.chapterId,
    required this.chapterTitle,
    required this.kind,
    required this.sectionTitle,
    required this.order,
    required this.text,
  });

  factory RetrievedChunk.fromIsar(EmbeddedChunkIsar chunk) {
    return RetrievedChunk(
      chunkId: chunk.chunkId,
      chapterId: chunk.chapterId,
      chapterTitle: chunk.chapterTitle,
      kind: chunk.kind,
      sectionTitle: chunk.sectionTitle,
      order: chunk.order,
      text: chunk.text,
    );
  }
}