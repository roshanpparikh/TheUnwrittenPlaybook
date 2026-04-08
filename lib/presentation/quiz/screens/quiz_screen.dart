import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/app_navigator.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_option.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_question.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/chapter_quiz_repository.dart';
import 'package:upwork_the_unwritten_playbook/presentation/quiz/screens/quiz_screen_cubit.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/gradient_action_button.dart';
import '../../../core/theme/colors.dart';

class QuizScreen extends StatefulBasePageWidget<ChapterQuizPageConfiguration> {
  QuizScreen._(super.pageConfiguration);

  @override
  State<QuizScreen> createState() => _QuizScreenState();

  static Page<dynamic> getPage(ChapterQuizPageConfiguration configuration) {
    final child = QuizScreen._(configuration);
    return MaterialPage(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,
    );
  }
}

class _QuizScreenState extends State<QuizScreen> {
  QuizScreenCubit? _cubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit ??= QuizScreenCubit(
      quizRepo: DependencyProvider.get<QuizRepository>(),
      chapter: widget.pageConfiguration.chapter,
    );
  }

  @override
  void dispose() {
    _cubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit!,
      child: BlocBuilder<QuizScreenCubit, QuizScreenState>(
        builder: (context, state) {
          if (state is QuizScreenLoading) {
            return AppScaffold(
              title: 'Test Your Knowledge',
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          if (state is QuizScreenError) {
            return AppScaffold(
              title: 'Test Your Knowledge',
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.message,
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<QuizScreenCubit>().load(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is QuizScreenResult) {
            return _QuizResultScreen(
              quiz: state.quiz,
              score: state.score,
              onRetake: () => context.read<QuizScreenCubit>().reset(),
              onReturn: () => context.navigator.pop(),
            );
          }

          final s = state as QuizScreenQuestion;
          return _QuizQuestionScreen(
            quiz: s.quiz,
            index: s.index,
            score: s.score,
            selectedOptionIds: s.selectedOptionIds,
            answered: s.answered,
            onSelect: (id) => context.read<QuizScreenCubit>().selectAnswer(id),
            onNext: () => context.read<QuizScreenCubit>().next(),
          );
        },
      ),
    );
  }
}

// ── Question screen ───────────────────────────────────────────────────────────

class _QuizQuestionScreen extends StatelessWidget {
  final ChapterQuiz quiz;
  final int index;
  final int score;
  final Set<String> selectedOptionIds;
  final bool answered;
  final ValueChanged<String> onSelect;
  final VoidCallback onNext;

  const _QuizQuestionScreen({
    required this.quiz,
    required this.index,
    required this.score,
    required this.selectedOptionIds,
    required this.answered,
    required this.onSelect,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final q = quiz.questions[index];
    final choiceData = _extractChoiceData(q);
    return AppScaffold(
      title: 'Test Your Knowledge',
      body: SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${index + 1}/${quiz.questions.length}',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: blue),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Score: $score',
                    style: const TextStyle(
                        fontSize: 12,
                        color: blue,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 6,
              child: LayoutBuilder(
                builder: (context, constraints) => Stack(
                  children: [
                    Container(
                        width: constraints.maxWidth,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1)),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      width: constraints.maxWidth *
                          (index + 1) /
                          quiz.questions.length,
                      decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(colors: [blue, deepBlue]),
                        borderRadius:
                            BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            if (q is TextQuestion)
              _TextQuestionBody(
                question: q,
                answered: answered,
                onSubmit: onSelect,
                onNext: onNext,
                isLast: index == quiz.questions.length - 1,
              )
            else if (q is ScaleQuestion)
              _ScaleQuestionBody(
                question: q,
                answered: answered,
                onSubmit: onSelect,
                onNext: onNext,
                isLast: index == quiz.questions.length - 1,
              )
            else if (choiceData == null)
              Text('Unsupported question type.',
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5), fontSize: 14))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    choiceData.prompt,
                    style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...choiceData.options.map(
                      (opt) => _OptionTile(
                        option: opt,
                        selectedOptionIds: selectedOptionIds,
                        answered: answered,
                        onTap: answered ? null : () => onSelect(opt.id),
                      )),
                  const SizedBox(height: 32),
                  if (answered) ...[
                    // _FeedbackCard(
                    //   isCorrect: choiceData.options
                    //       .any((o) =>
                    //           selectedOptionIds.contains(o.id) && o.isCorrect == true),
                    //   explanation: choiceData.explanation,
                    // ),
                    // const SizedBox(height: 24),
                    _GradientButton(
                      label: index == quiz.questions.length - 1
                          ? 'See Results'
                          : 'Next Question →',
                      colors: const [blue, deepBlue],
                      shadowColor: blue,
                      onTap: onNext,
                    ),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }

  _ChoiceData? _extractChoiceData(QuizQuestion q) => q.maybeMap(
        single: (sq) =>
            _ChoiceData(sq.prompt, sq.options, sq.explanation),
        multi: (mq) =>
            _ChoiceData(mq.prompt, mq.options, mq.explanation),
        scenario: (sq) =>
            _ChoiceData(sq.prompt, sq.options, sq.explanation),
        orElse: () => null,
      );
}

class _ChoiceData {
  final String prompt;
  final List<QuizOption> options;
  final String? explanation;
  const _ChoiceData(this.prompt, this.options, this.explanation);
}

// ── Text question body ────────────────────────────────────────────────────────

class _TextQuestionBody extends StatefulWidget {
  final TextQuestion question;
  final bool answered;
  final ValueChanged<String> onSubmit;
  final VoidCallback onNext;
  final bool isLast;

  const _TextQuestionBody({
    required this.question,
    required this.answered,
    required this.onSubmit,
    required this.onNext,
    required this.isLast,
  });

  @override
  State<_TextQuestionBody> createState() => _TextQuestionBodyState();
}

class _TextQuestionBodyState extends State<_TextQuestionBody> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int get _length => _controller.text.length;
  int get _minLength => widget.question.minLength ?? 0;
  int? get _maxLength => widget.question.maxLength;
  bool get _isValid =>
      _length >= _minLength && (_maxLength == null || _length <= _maxLength!);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.prompt,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        if (!widget.answered) ...[
          TextField(
            controller: _controller,
            maxLines: 5,
            maxLength: _maxLength,
            onChanged: (_) => setState(() {}),
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14, height: 1.6),
            decoration: InputDecoration(
              hintText: widget.question.placeholder ?? 'Type your answer…',
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)),
              counterStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5), fontSize: 12),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.08)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.08)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: blue),
              ),
            ),
          ),
          if (_minLength > 0)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '$_length / $_minLength minimum characters',
                style: TextStyle(
                  fontSize: 12,
                  color: _isValid ? sage : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
          const SizedBox(height: 24),
          _GradientButton(
            label: 'Submit Answer',
            colors: _isValid
                ? const [blue, deepBlue]
                : const [Color(0xFF444444), Color(0xFF333333)],
            shadowColor: _isValid ? blue : Colors.transparent,
            onTap: _isValid ? () => widget.onSubmit(_controller.text) : () {},
          ),
        ] else ...[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0x0AFCFCFC),
              border: Border.all(color: sage),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _controller.text,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14, height: 1.6),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0x1510B981), Color(0x0A10B981)],
              ),
              border: Border.all(color: sage),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Text('✓',
                    style:
                        TextStyle(color: sage, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text('Response saved',
                    style: TextStyle(color: sage, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _GradientButton(
            label: widget.isLast ? 'See Results' : 'Next Question →',
            colors: const [blue, deepBlue],
            shadowColor: blue,
            onTap: widget.onNext,
          ),
        ],
      ],
    );
  }
}

// ── Scale question body ───────────────────────────────────────────────────────

class _ScaleQuestionBody extends StatefulWidget {
  final ScaleQuestion question;
  final bool answered;
  final ValueChanged<String> onSubmit;
  final VoidCallback onNext;
  final bool isLast;

  const _ScaleQuestionBody({
    required this.question,
    required this.answered,
    required this.onSubmit,
    required this.onNext,
    required this.isLast,
  });

  @override
  State<_ScaleQuestionBody> createState() => _ScaleQuestionBodyState();
}

class _ScaleQuestionBodyState extends State<_ScaleQuestionBody> {
  late double _value;

  @override
  void initState() {
    super.initState();
    final q = widget.question;
    _value = ((q.min + q.max) / 2).roundToDouble();
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.question;
    final current = _value.round();
    final divisions = q.step > 0 ? (q.max - q.min) ~/ q.step : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          q.prompt,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 32),
        if (!widget.answered) ...[
          Center(
            child: Text(
              '$current',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: blue,
              inactiveTrackColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
              thumbColor: blue,
              overlayColor: const Color(0x1A2D5BFF),
              trackHeight: 4,
            ),
            child: Slider(
              value: _value,
              min: q.min.toDouble(),
              max: q.max.toDouble(),
              divisions: divisions,
              onChanged: (v) => setState(() => _value = v),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                q.minLabel ?? '${q.min}',
                style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)),
              ),
              Text(
                q.maxLabel ?? '${q.max}',
                style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _GradientButton(
            label: 'Submit Answer',
            colors: const [blue, deepBlue],
            shadowColor: blue,
            onTap: () => widget.onSubmit('$current'),
          ),
        ] else ...[
          Center(
            child: Column(
              children: [
                Text(
                  '$current',
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w700,
                    color: blue,
                  ),
                ),
                if (current == q.min && q.minLabel != null)
                  Text(q.minLabel!,
                      style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)))
                else if (current == q.max && q.maxLabel != null)
                  Text(q.maxLabel!,
                      style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5))),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0x1510B981), Color(0x0A10B981)],
              ),
              border: Border.all(color: sage),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Text('✓',
                    style:
                        TextStyle(color: sage, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text('Response saved',
                    style: TextStyle(color: sage, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _GradientButton(
            label: widget.isLast ? 'See Results' : 'Next Question →',
            colors: const [blue, deepBlue],
            shadowColor: blue,
            onTap: widget.onNext,
          ),
        ],
      ],
    );
  }
}

// ── Option tile ───────────────────────────────────────────────────────────────

class _OptionTile extends StatefulWidget {
  final QuizOption option;
  final Set<String> selectedOptionIds;
  final bool answered;
  final VoidCallback? onTap;

  const _OptionTile({
    required this.option,
    required this.selectedOptionIds,
    required this.answered,
    required this.onTap,
  });

  @override
  State<_OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<_OptionTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;

  bool get _isSelected =>
      widget.selectedOptionIds.contains(widget.option.id);
  bool get _isCorrect => widget.option.isCorrect == true;
  bool get _showBorderAnim =>
      widget.answered && (_isCorrect || _isSelected);
  bool get _isOther =>
      widget.answered && !_isCorrect && !_isSelected;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _progress =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    if (widget.answered) _controller.value = 1.0;
  }

  @override
  void didUpdateWidget(_OptionTile old) {
    super.didUpdateWidget(old);
    if (!old.answered && widget.answered) {
      _controller.forward(from: 0);
    } else if (!widget.answered) {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = _isSelected;
    final isCorrect = _isCorrect;
    final borderColor = isCorrect ? sage : ember;

    Widget tile = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: widget.answered
            ? (isCorrect
                ? const LinearGradient(
                    colors: [Color(0x1510B981), Color(0x0A10B981)])
                : isSelected
                    ? const LinearGradient(
                        colors: [Color(0x15FF6B35), Color(0x0AFF6B35)])
                    : null)
            : (isSelected
                ? const LinearGradient(
                    colors: [Color(0x1A2D5BFF), Color(0x0A4F46E5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null),
        color: (!widget.answered && !isSelected) ||
                (widget.answered && !isCorrect && !isSelected)
            ? const Color(0x0AFCFCFC)
            : null,
        border: Border.all(
          color: widget.answered
              ? (_showBorderAnim
                  ? borderColor.withValues(alpha: 0.15)
                  : const Color(0x14FCFCFC))
              : (isSelected ? blue : const Color(0x14FCFCFC)),
          width: isSelected || (widget.answered && isCorrect) ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.answered
                    ? (isCorrect ? sage : (isSelected ? ember : muted))
                    : (isSelected ? blue : muted),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: widget.answered
                ? Center(
                    child: Text(
                      isCorrect ? '✓' : (isSelected ? '✗' : ''),
                      style: TextStyle(
                        color: isCorrect ? sage : ember,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.option.text,
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.5),
            ),
          ),
        ],
      ),
    );

    if (_showBorderAnim) {
      tile = AnimatedBuilder(
        animation: _progress,
        builder: (context, child) => Stack(
          children: [
            child!,
            Positioned.fill(
              child: CustomPaint(
                painter: _BorderProgressPainter(
                  progress: _progress.value,
                  color: borderColor,
                  borderRadius: 12,
                ),
              ),
            ),
          ],
        ),
        child: tile,
      );
    }

    if (_isOther) {
      tile = AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Opacity(
          opacity: 1.0 - (_controller.value * 0.6),
          child: child,
        ),
        child: tile,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: widget.onTap,
        child: tile,
      ),
    );
  }
}

class _BorderProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double borderRadius;
  final double strokeWidth = 1.5;

  const _BorderProgressPainter({
    required this.progress,
    required this.color,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sw = strokeWidth / 2;
    final r = borderRadius;
    final l = sw;
    final t = sw;
    final ri = size.width - sw;
    final b = size.height - sw;

    // Path starting at top-left corner (after arc), going clockwise
    final path = Path()
      ..moveTo(l + r, t)
      ..lineTo(ri - r, t)
      ..arcToPoint(Offset(ri, t + r), radius: Radius.circular(r))
      ..lineTo(ri, b - r)
      ..arcToPoint(Offset(ri - r, b), radius: Radius.circular(r))
      ..lineTo(l + r, b)
      ..arcToPoint(Offset(l, b - r), radius: Radius.circular(r))
      ..lineTo(l, t + r)
      ..arcToPoint(Offset(l + r, t), radius: Radius.circular(r));

    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return;

    final totalLength =
        metrics.fold<double>(0, (sum, m) => sum + m.length);
    double remaining = totalLength * progress;

    for (final metric in metrics) {
      if (remaining <= 0) break;
      final draw =
          metric.extractPath(0, remaining.clamp(0.0, metric.length));
      canvas.drawPath(draw, paint);
      remaining -= metric.length;
    }
  }

  @override
  bool shouldRepaint(_BorderProgressPainter old) =>
      old.progress != progress || old.color != color;
}

// ── Feedback card ─────────────────────────────────────────────────────────────

class _FeedbackCard extends StatelessWidget {
  final bool isCorrect;
  final String? explanation;

  const _FeedbackCard({required this.isCorrect, this.explanation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isCorrect
              ? const [Color(0x1510B981), Color(0x0A10B981)]
              : const [Color(0x15FF6B35), Color(0x0AFF6B35)],
        ),
        border: Border.all(color: isCorrect ? sage : ember, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCorrect ? '✓ Correct!' : '✗ Incorrect',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isCorrect ? sage : ember,
            ),
          ),
          if (explanation != null && explanation!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(explanation!,
                style: TextStyle(
                    fontSize: 13, color: Theme.of(context).colorScheme.onSurface, height: 1.6)),
          ],
        ],
      ),
    );
  }
}

// ── Results screen ────────────────────────────────────────────────────────────

class _QuizResultScreen extends StatelessWidget {
  final ChapterQuiz quiz;
  final int score;
  final VoidCallback onRetake;
  final VoidCallback onReturn;

  const _QuizResultScreen({
    required this.quiz,
    required this.score,
    required this.onRetake,
    required this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    final total = quiz.questions
        .where((q) => q.maybeMap(text: (_) => false, scale: (_) => false, orElse: () => true))
        .length;
    final percentage = ((score / total) * 100).toStringAsFixed(0);
    final passed = score >= (total / 2).ceil();

    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text(
            passed ? '🎓 Excellent!' : '📚 Keep Learning',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          Text(
            'You scored $score out of $total',
            style: const TextStyle(
              fontFamily: 'Fraunces',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$percentage%',
            style: TextStyle(
                fontSize: 48, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0x162D5BFF), Color(0x0A2D5BFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: const Color(0x252D5BFF)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  passed ? 'Your Knowledge Assessment' : 'Next Steps',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  passed
                      ? 'You demonstrate a solid understanding of the playbook\'s core principles. You\'re ready to apply these insights in affluent social settings.'
                      : 'Review the Playbook and Glossary sections to strengthen your knowledge. Cultural fluency is built through repeated exposure and practice.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                      height: 1.6),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          if (score < total) ...[
            _GradientButton(
              label: 'Retake Quiz',
              colors: const [blue, deepBlue],
              shadowColor: blue,
              onTap: onRetake,
            ),
            const SizedBox(height: 20),
          ],
          GradientActionButton(
            title: 'Return to reading',
            onTap: onReturn,
            ember: ember,
            deepEmber: deepEmber,
          ),
        ],
      ),
    );
  }
}

// ── Shared gradient button ────────────────────────────────────────────────────

class _GradientButton extends StatelessWidget {
  final String label;
  final List<Color> colors;
  final Color shadowColor;
  final VoidCallback onTap;

  const _GradientButton({
    required this.label,
    required this.colors,
    required this.shadowColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: shadowColor.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8))
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
