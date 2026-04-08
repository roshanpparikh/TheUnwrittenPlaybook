import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/app_navigator.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/transitions/no_transition_animation_material_page.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/gradient_action_button.dart';
import '../../../core/theme/colors.dart';

class WelcomeScreen
    extends StatelessBasePageWidget<WelcomePageConfiguration> {
  WelcomeScreen._(super.pageConfiguration);

  static Page<dynamic> getPage(WelcomePageConfiguration configuration) {
    final child = WelcomeScreen._(configuration);
    return NoTransitionAnimationMaterialPage(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,
    );
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return AppScaffold(
      showGradientBackground: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                'THE UNWRITTEN PLAYBOOK',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 3,
                  color: onSurface.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Everything They Assume\n',
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: onSurface,
                        height: 1.2,
                      ),
                    ),
                    const TextSpan(
                      text: 'You Already Know',
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: ember,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'A personalized guide to the conversations, culture, and customs of elevated circles.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: onSurface.withValues(alpha: 0.5), height: 1.6),
                ),
              ),
              const SizedBox(height: 48),
              GradientActionButton(
                title: 'Build My Playbook',
                ember: ember,
                deepEmber: deepEmber,
                onTap: () => context.navigator.replacePage(
                  PageConfiguration.personalizationQuiz,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '8 questions · 2 minutes · Completely personalized',
                style: TextStyle(fontSize: 12, color: onSurface.withValues(alpha: 0.4)),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
