import 'dart:math';

import 'package:isar_community/isar.dart';

import 'embedded_chunk_isar.dart';

class EmbeddedChunkRepository {
  final Isar isar;

  EmbeddedChunkRepository(this.isar);

  Future<List<EmbeddedChunkIsar>> getAllChunks() {
    return isar.embeddedChunkIsars.where().findAll();
  }

  Future<List<EmbeddedChunkIsar>> getChunksByChapter(String chapterId) {
    return isar.embeddedChunkIsars
        .filter()
        .chapterIdEqualTo(chapterId)
        .sortByOrder()
        .findAll();
  }

  Future<List<EmbeddedChunkIsar>> searchTopK({
    required List<double> queryEmbedding,
    String? chapterId,
    int topK = 5,
  }) async {
    List<EmbeddedChunkIsar> chunks;

    if (chapterId != null) {
      chunks = await isar.embeddedChunkIsars
          .filter()
          .chapterIdEqualTo(chapterId)
          .findAll();
    } else {
      chunks = await isar.embeddedChunkIsars.where().findAll();
    }

    final scored = chunks.map((chunk) {
      final score = cosineSimilarity(queryEmbedding, chunk.embedding);
      return _ScoredChunk(chunk: chunk, score: score);
    }).toList();

    scored.sort((a, b) => b.score.compareTo(a.score));

    return scored.take(topK).map((e) => e.chunk).toList();
  }

  double cosineSimilarity(List<double> a, List<double> b) {
    if (a.length != b.length || a.isEmpty) {
      return -1.0;
    }

    double dot = 0;
    double normA = 0;
    double normB = 0;

    for (int i = 0; i < a.length; i++) {
      dot += a[i] * b[i];
      normA += a[i] * a[i];
      normB += b[i] * b[i];
    }

    if (normA == 0 || normB == 0) {
      return -1.0;
    }

    return dot / (sqrt(normA) * sqrt(normB));
  }
}

class _ScoredChunk {
  final EmbeddedChunkIsar chunk;
  final double score;

  _ScoredChunk({
    required this.chunk,
    required this.score,
  });
}