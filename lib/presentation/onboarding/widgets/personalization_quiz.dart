
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';
import '../../../core/theme/colors.dart';
import 'quiz_questions.dart';

class PersonalizationQuiz extends StatefulBasePageWidget<PersonalizationQuizPageConfiguration> {
  PersonalizationQuiz._(super.configuration);

  @override
  State<PersonalizationQuiz> createState() => _PersonalizationQuizState();

  static Page<dynamic> getPage(
      PersonalizationQuizPageConfiguration configuration,
      ) {
    final child = PersonalizationQuiz._(configuration);
    return MaterialPage(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,
    );
  }
}

class _PersonalizationQuizState extends State<PersonalizationQuiz> {
  int currentQuestion = 0;
  var _info = const PersonalInfo();
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = kQuizQuestions[currentQuestion];
    final progress = ((currentQuestion + 1) / kQuizQuestions.length) * 100;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppScaffold(
      scrolling: false,
      bodyPadding: EdgeInsets.zero,
      body: SafeArea(
        child: Column(
          children: [
            // Gradient progress bar
            SizedBox(
              height: 3,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        color: onSurface.withValues(alpha: 0.05),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: constraints.maxWidth * (progress / 100),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [blue, ember, sage],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (currentQuestion > 0)
                          GestureDetector(
                            onTap: _previousQuestion,
                            child: Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: onSurface.withValues(alpha: 0.4)),
                          )
                        else
                          const SizedBox(width: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${currentQuestion + 1} of ${kQuizQuestions.length}',
                              style: TextStyle(fontSize: 16, color: onSurface.withValues(alpha: 0.6)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      question['question'] as String,
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: onSurface,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      question['subtitle'] as String,
                      style: TextStyle(fontSize: 13, color: onSurface.withValues(alpha: 0.5), height: 1.5),
                    ),
                    const SizedBox(height: 28),
                    _buildQuestionContent(question, onSurface),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionContent(Map<String, dynamic> question, Color onSurface) {
    final type = question['type'] as String;

    if (type == 'text') {
      return Column(
        children: [
          TextField(
            controller: nameController,
            autofocus: true,
            style: TextStyle(color: onSurface, fontSize: 16),
            decoration: InputDecoration(
              hintText: question['placeholder'] as String,
              hintStyle: TextStyle(color: onSurface.withValues(alpha: 0.4)),
              filled: true,
              fillColor: onSurface.withValues(alpha: 0.04),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: onSurface.withValues(alpha: 0.08)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: onSurface.withValues(alpha: 0.08)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: blue),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
          ),
          const SizedBox(height: 24),
          _gradientButton(
            label: 'Continue →',
            enabled: nameController.text.isNotEmpty,
            colors: const [blue, deepBlue],
            shadowColor: blue,
            onTap: nameController.text.isNotEmpty ? _nextQuestion : null,
          ),
        ],
      );
    } else if (type == 'single') {
      final options = question['options'] as List<dynamic>;
      return Column(
        children: [
          for (int i = 0; i < options.length; i++)
            _buildSingleOption(options[i] as Map<String, dynamic>, question['id'] as String, i, onSurface),
        ],
      );
    } else if (type == 'multi') {
      final options = question['options'] as List<dynamic>;
      return Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: List.generate(options.length, (i) {
              final option = options[i] as Map<String, dynamic>;
              final isSelected = _info.interests.contains(option['value']);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    final current = List<String>.from(_info.interests);
                    if (isSelected) {
                      current.remove(option['value'] as String);
                    } else {
                      current.add(option['value'] as String);
                    }
                    _info = _info.copyWith(interests: current);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                            colors: [Color(0x332D5BFF), Color(0x1A4F46E5)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                    color: isSelected ? null : onSurface.withValues(alpha: 0.04),
                    border: Border.all(
                      color: isSelected ? blue : onSurface.withValues(alpha: 0.08),
                      width: isSelected ? 1.5 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(option['icon'] as String, style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 8),
                      Text(
                        option['label'] as String,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: onSurface),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          if (_info.interests.length >= 3)
            _gradientButton(
              label: 'Continue with ${_info.interests.length} selected →',
              enabled: true,
              colors: const [blue, deepBlue],
              shadowColor: blue,
              onTap: _nextQuestion,
            )
          else
            Text(
              _info.interests.isEmpty ? 'Pick at least 3' : 'Pick at least ${3 - _info.interests.length} more',
              style: TextStyle(fontSize: 12, color: onSurface.withValues(alpha: 0.4)),
              textAlign: TextAlign.center,
            ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildSingleOption(Map<String, dynamic> option, String questionId, int index, Color onSurface) {
    final isSelected = quizGetAnswer(_info, questionId) == option['value'];
    return GestureDetector(
      onTap: () {
        setState(() => _info = quizSetAnswer(_info, questionId, option['value'] as String));
        Future.delayed(const Duration(milliseconds: 300), _nextQuestion);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0x332D5BFF), Color(0x1A4F46E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : onSurface.withValues(alpha: 0.04),
          border: Border.all(
            color: isSelected ? blue : onSurface.withValues(alpha: 0.08),
            width: isSelected ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              child: Text(option['icon'] as String, style: const TextStyle(fontSize: 22), textAlign: TextAlign.center),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                option['label'] as String,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: onSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gradientButton({
    required String label,
    required bool enabled,
    required List<Color> colors,
    required Color shadowColor,
    required VoidCallback? onTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: enabled ? LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
        color: enabled ? null : Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        boxShadow: enabled
            ? [BoxShadow(color: shadowColor.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 8))]
            : null,
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
              style: const TextStyle(color: white, fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  void _previousQuestion() {
    if (currentQuestion == 0) return;
    setState(() {
      currentQuestion--;
      if (kQuizQuestions[currentQuestion]['type'] == 'text') {
        nameController.text = _info.name;
      } else {
        nameController.clear();
      }
    });
  }

  void _nextQuestion() {
    if (kQuizQuestions[currentQuestion]['type'] == 'text') {
      _info = _info.copyWith(name: nameController.text.trim());
    }

    if (currentQuestion < kQuizQuestions.length - 1) {
      setState(() {
        currentQuestion++;
        nameController.clear();
      });
    } else {
      _completeQuiz();
    }
  }

  void _completeQuiz() {
    final bloc = context.read<AppBloc>();
    final info = _info;
    Future.delayed(const Duration(milliseconds: 500), () {
      bloc.completeOnboarding(info);
    });
  }
}
