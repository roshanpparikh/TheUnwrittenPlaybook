enum ChapterTtsStatus {
  initial,
  loading,
  ready,
  playing,
  paused,
  error,
}

class ChapterTtsState {
  final ChapterTtsStatus status;
  final String? localPath;
  final Duration position;
  final Duration duration;
  final String? error;

  final bool isGenerating;
  final int totalChunks;
  final int completedChunks;
  final String? currentChunkLabel;

  const ChapterTtsState({
    required this.status,
    required this.position,
    required this.duration,
    this.localPath,
    this.error,

    required this.isGenerating,
    required this.totalChunks,
    required this.completedChunks,
    this.currentChunkLabel,
  });

  double get progress =>
      totalChunks == 0 ? 0 : completedChunks / totalChunks;


  factory ChapterTtsState.initial() {
    return const ChapterTtsState(
      status: ChapterTtsStatus.initial,
      position: Duration.zero,
      duration: Duration.zero,
      isGenerating: false,
      totalChunks: 0,
      completedChunks: 0,

    );
  }

  ChapterTtsState copyWith({
    ChapterTtsStatus? status,
    String? localPath,
    Duration? position,
    Duration? duration,
    String? error,
    String? currentChunkLabel,
    bool? isGenerating,
    int? totalChunks,
    int? completedChunks,
  }) {
    return ChapterTtsState(
      status: status ?? this.status,
      localPath: localPath ?? this.localPath,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      error: error ?? this.error,
      isGenerating: isGenerating ?? this.isGenerating,
      totalChunks: totalChunks ?? this.totalChunks,
      completedChunks: completedChunks ?? this.completedChunks,
        currentChunkLabel: currentChunkLabel ?? this.currentChunkLabel
    );
  }
}