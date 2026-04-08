class TtsGenerationProgress {
  final int totalChunks;
  final int completedChunks;
  final String? currentChunkId;
  final String? currentChunkLabel;

  const TtsGenerationProgress({
    required this.totalChunks,
    required this.completedChunks,
    this.currentChunkId,
    this.currentChunkLabel,
  });

  double get fraction =>
      totalChunks == 0 ? 0 : completedChunks / totalChunks;
}