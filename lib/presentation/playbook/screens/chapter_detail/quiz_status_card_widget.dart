import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz_result.dart';

class QuizStatusCardWidget extends StatelessWidget {
  final ChapterQuizResult? quizResult;
  final VoidCallback onStartQuiz;
  final VoidCallback onRestartQuiz;

  const QuizStatusCardWidget({super.key, 
    required this.quizResult,
    required this.onStartQuiz,
    required this.onRestartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    final taken = quizResult != null;
    final passed = quizResult?.passed ?? false;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: passed
              ? [const Color(0x2010B981), const Color(0x0810B981)]
              : [const Color(0x162D5BFF), const Color(0x0A2D5BFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: passed ? const Color(0x3010B981) : const Color(0x252D5BFF),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KNOWLEDGE CHECK',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: blue,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          if (!taken) ...[
            Text(
              'Test Your Knowledge',
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ready to see how much you\'ve absorbed? Take the quiz to test your understanding of this chapter\'s key concepts.',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.8),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            _button(label: 'Start Quiz →', onTap: onStartQuiz),
          ] else ...[
            Row(
              children: [
                Text(
                  passed ? '🎓 Passed' : '📚 Not Passed',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: passed ? sage : ember,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: passed ? sage : ember),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${quizResult!.score} / ${quizResult!.total}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: passed ? sage : ember,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              passed
                  ? 'Great work! You\'ve demonstrated a solid understanding of this material.'
                  : 'Keep studying and try again — cultural fluency is built through practice.',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.8),
                height: 1.6,
              ),
            ),
            if (quizResult!.openAnswers.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 16),
              ...quizResult!.openAnswers.map((a) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      a.prompt,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        a.type == 'scale' ? '${a.answer} / 5' : a.answer,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurface,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
            const SizedBox(height: 16),
            _button(label: 'Retake Quiz', onTap: onRestartQuiz),
          ],
        ],
      ),
    );
  }

  Widget _button({required String label, required VoidCallback onTap}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [blue, deepBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: blue.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

