import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_option.dart';

class SingleChoiceQuestionView extends StatelessWidget {
  final String prompt;
  final List<QuizOption> options;
  final String? selectedId;
  final ValueChanged<String> onSelect;

  const SingleChoiceQuestionView({
    super.key,
    required this.prompt,
    required this.options,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          prompt,
          style: theme.textTheme.titleMedium,
        ),

        const SizedBox(height: 16),

        Expanded(
          child: ListView.separated(
            itemCount: options.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final option = options[index];

              return Card(
                child: RadioListTile<String>(
                  value: option.id,
                  groupValue: selectedId,
                  onChanged: (value) {
                    if (value != null) {
                      onSelect(value);
                    }
                  },
                  title: Text(option.text),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}