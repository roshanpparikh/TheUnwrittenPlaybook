import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/gradient_action_button.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/use_cases/generate_speech_use_case.dart';

import 'voice_selection_cubit.dart';
import 'voice_selection_state.dart';
import 'voice_tile.dart';

class VoiceSelectionScreen
    extends StatelessBasePageWidget<VoiceSelectionPageConfiguration> {
  VoiceSelectionScreen._(super.configuration);

  static Page<dynamic> getPage(VoiceSelectionPageConfiguration configuration) {
    final child = VoiceSelectionScreen._(configuration);
    return MaterialPage(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VoiceSelectionCubit(
        generateSpeechUseCase: DependencyProvider.get<GenerateSpeechUseCase>(),
        player: AudioPlayer(),
        userRepository: DependencyProvider.get<UserRepository>(),
      ),
      child: AppScaffold(
        title: 'Select Voice',
        scrolling: false,
        body: BlocBuilder<VoiceSelectionCubit, VoiceSelectionState>(
          builder: (context, state) {
            final cubit = context.read<VoiceSelectionCubit>();
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                      child: Text(
                        'Choose a narrator voice for listening to chapters.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.55),
                          height: 1.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                        itemCount: state.voices.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final voice = state.voices[index];
                          final isSelected =
                              state.selectedVoice?.voice == voice.voice;
                          return VoiceTile(
                            item: voice,
                            isSelected: isSelected,
                            onTap: () => cubit.selectVoice(voice),
                            onStop: cubit.stopPreview,
                          );
                        },
                      ),
                    ),
                    if (state.error != null && state.error!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: Text(
                          state.error!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      child: state.selectedVoice == null
                          ? const SizedBox.shrink()
                          : GradientActionButton(
                            onTap: state.isSaving ? null : () async {
                              final isSaved = await cubit.save();
                              if(!isSaved) return;
                              context.read<AppBloc>().add(AppEvent.setNavigationAction(
                                NavigationAction.pop()
                              ));
                            },
                            title: state.isSaving
                                ? 'Saving…'
                                : 'Use "${state.selectedVoice!.voice.title}"',
                            ember: ember,
                            deepEmber: deepEmber,
                          ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
