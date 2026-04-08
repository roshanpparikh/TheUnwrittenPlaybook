import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/data/daily_fact.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/gradient_action_button.dart';

class DailyFactDialog extends StatelessWidget {
  final DailyFact fact;

  const DailyFactDialog({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final textTheme = Theme.of(context).textTheme;

  

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? const [Color(0xFF0D1F3C), Color(0xFF1A3356)]
                : const [Color(0xFFF7FAFF), Color(0xFFEFF4FF)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isDark ? const Color(0x402D5BFF) : const Color(0x302D5BFF),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.5)
                  : const Color(0xFF2D5BFF).withValues(alpha: 0.1),
              blurRadius: 40,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header row: icon badge + close button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
              
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [ember, deepEmber],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: ember.withValues(alpha: 0.35),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.auto_awesome_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Daily Fact',
                        style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: onSurface,
                          height: 1.2,
                        ),
                      ),
                    
                      
                    ],
                  ),
                  const SizedBox(height: 16),
              
                  // Interests labels
                  Wrap(
                    runSpacing: 6.0,
                    spacing: 6.0,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      for(final interest in fact.interests)
                          Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: '• ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: ember,
                              ),
                            ),
                            TextSpan(text: interest.toUpperCase()),
                          ],
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.8,
                          color: ember,
                        ),
                      ),
                    ],
                  ),
                
              
                  const SizedBox(height: 4),
              
                  // Push body / subtitle
                  Text(
                    fact.pushBody,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: onSurface.withValues(alpha: 0.55),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
              
                  // Full body content card
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxHeight: 280),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isDark
                            ? const [Color(0x1A2D5BFF), Color(0x0DFF6B35)]
                            : const [Color(0x142D5BFF), Color(0x0AFF6B35)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark
                            ? const Color(0x252D5BFF)
                            : const Color(0x302D5BFF),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        fact.fullBody,
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          height: 1.7,
                          color: onSurface.withValues(alpha: isDark ? 0.85 : 0.8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
              
                  // CTA button
                  GradientActionButton(
                    title: 'Got it',
                    onTap: () => Navigator.of(context).pop(),
                    ember: ember,
                    deepEmber: deepEmber,
                    verticalPadding: 14,
                    fontSize: 15,
                    borderRadius: 14,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: onSurface.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: onSurface.withValues(alpha: 0.45),
                        size: 18,
                      ),
                    ),
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
