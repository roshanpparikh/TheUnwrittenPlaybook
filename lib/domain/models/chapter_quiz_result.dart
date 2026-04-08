class SavedOpenAnswer {
  final String questionId;
  final String prompt;
  final String type; // 'text' or 'scale'
  final String answer;

  const SavedOpenAnswer({
    required this.questionId,
    required this.prompt,
    required this.type,
    required this.answer,
  });

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'prompt': prompt,
    'type': type,
    'answer': answer,
  };

  factory SavedOpenAnswer.fromJson(Map<String, dynamic> json) => SavedOpenAnswer(
    questionId: json['questionId'] as String,
    prompt: json['prompt'] as String,
    type: json['type'] as String,
    answer: json['answer'] as String,
  );
}

/// The result of a user completing the knowledge quiz for a specific chapter.
class ChapterQuizResult {
  final int chapterNumber;
  final int score;
  final int total;
  final List<SavedOpenAnswer> openAnswers;

  const ChapterQuizResult({
    required this.chapterNumber,
    required this.score,
    required this.total,
    this.openAnswers = const [],
  });

  bool get passed => score >= (total / 2).ceil();

  Map<String, dynamic> toJson() => {
    'chapterNumber': chapterNumber,
    'score': score,
    'total': total,
    'openAnswers': openAnswers.map((a) => a.toJson()).toList(),
  };

  factory ChapterQuizResult.fromJson(Map<String, dynamic> json) =>
      ChapterQuizResult(
        chapterNumber: json['chapterNumber'],
        score: (json['score'] as num).toInt(),
        total: (json['total'] as num).toInt(),
        openAnswers: (json['openAnswers'] as List?)
                ?.whereType<Map<String, dynamic>>()
                .map(SavedOpenAnswer.fromJson)
                .toList() ??
            const [],
      );
}
