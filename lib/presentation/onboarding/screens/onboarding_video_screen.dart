import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/transitions/fade_transition.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/context_utils.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/gradient_action_button.dart';
import 'package:video_player/video_player.dart';

class OnboardingVideoScreen extends StatefulBasePageWidget<OnboardingPageConfiguration> {
  OnboardingVideoScreen._(super.pageConfiguration);

  @override
  State<OnboardingVideoScreen> createState() => _OnboardingVideoScreenState();

  static Page<dynamic> getPage(OnboardingPageConfiguration configuration) {
    final child = OnboardingVideoScreen._(configuration);
    return FadeTransitionPage(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,
    );
  }
}

class _OnboardingVideoScreenState extends State<OnboardingVideoScreen> {
  late final VideoPlayerController _controller;
  bool _ready = false;
  bool _finished = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/video/onboarding.mp4')
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() => _ready = true);
        _controller.play();
      });

    _controller.addListener(_onVideoTick);
  }

  void _onVideoTick() {
    if (!_controller.value.isInitialized) return;

    final v = _controller.value;
    if (v.position >= v.duration && !v.isPlaying && !_finished) {
      setState(() => _finished = true);
    }
  }

  void _onDone() {
    _closeOnboardingScreen(true);
  }

  void _onSkip() {
    _closeOnboardingScreen(false);
  }

  void _closeOnboardingScreen(bool viewed) {
    context.read<AppBloc>().add(AppEvent.closeOnboardingVideo(viewed));
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideoTick);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return AppScaffold(
      bodyPadding: EdgeInsets.zero,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: _ready
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const CircularProgressIndicator(),
            ),

            // Skip button
            Positioned(
              top: 12,
              right: 12,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 600),
                child: _finished ? SizedBox(key: ValueKey("hide_skip_button"),) : TextButton(
                  key: ValueKey("show_skip_button"),
                  onPressed: _onSkip,
                  child: Text(
                    'Skip',
                    style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),

            if (_finished)
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: GradientActionButton(
                  title: 'Continue',
                  ember: ember,
                  deepEmber: deepEmber,
                  onTap: _onDone,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
