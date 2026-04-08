import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/app_navigator.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/base_page_widget.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/context_utils.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_cubit.dart';
import 'package:upwork_the_unwritten_playbook/presentation/onboarding/widgets/quiz_option_widgets.dart';
import 'package:upwork_the_unwritten_playbook/presentation/onboarding/widgets/quiz_questions.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/app_scaffold.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/repositories/tts_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/voice_selector/voice_preview_item.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/presentation/voice_selector/voice_tile.dart';
import 'profile_cubit.dart';

import 'package:app_settings/app_settings.dart';

import '../../core/theme/colors.dart';

// ── Page widget ──────────────────────────────────────────────────────────────

class ProfileScreen extends StatelessBasePageWidget<ProfilePageConfiguration> {
  ProfileScreen._(super.configuration);

  @override
  Widget build(BuildContext context) {
    final initialInfo = context.read<AppBloc>().state.userState.personalInfo;
    return BlocProvider(
      create: (_) => ProfileScreenCubit(
        DependencyProvider.get<UserRepository>(),
        initialInfo,
      ),
      child: const _ProfileBody(),
    );
  }

  static Page<dynamic> getPage(ProfilePageConfiguration configuration) {
    final child = ProfileScreen._(configuration);
    return MaterialPage(
      key: ValueKey(child.pageConfiguration.key),
      child: child,
      name: child.pageConfiguration.path,
      arguments: child.pageConfiguration,
    );
  }
}

// ── Stateful body ────────────────────────────────────────────────────────────

class _ProfileBody extends StatefulWidget {
  const _ProfileBody();

  @override
  State<_ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<_ProfileBody> {
  bool _editing = false;
  late PersonalInfo _editingInfo;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startEditing(PersonalInfo info) {
    _editingInfo = info;
    _nameController.text = info.name;
    setState(() => _editing = true);
  }

  Future<void> _save() async {
    _editingInfo = _editingInfo.copyWith(name: _nameController.text.trim());
    final cubit = context.read<ProfileScreenCubit>();
    await cubit.save(_editingInfo);
    if (!mounted) return;
    setState(() => _editing = false);
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final cubitState = context.watch<ProfileScreenCubit>().state;
    final info = cubitState.info;
    final canSave =
        _nameController.text.trim().isNotEmpty && !cubitState.isSaving;

    final textTheme = TextTheme.of(context);

    return AppScaffold(
      title: _editing ? 'EDIT PROFILE' : 'PROFILE',
      leading: _editing ? IconButton(
      icon: Icon(Icons.cancel,
        size: 30,
      ),
      color: context.isDarkMode ? Colors.white : Colors.black,
      onPressed: () => setState(() => _editing = false),
    ) : null,
      appBarActions: [
        !_editing
            ? IconButton(
                icon: Icon(Icons.edit_outlined, size: 20, color: onSurface),
                onPressed: () => _startEditing(info),
              )
            : TextButton(
                onPressed: canSave ? _save : null,
                child: Text(
                  'Save',
                  style: textTheme.titleLarge?.copyWith(
                    color: canSave ? blue : onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ),
      ],
      scrolling: false,
      body: _editing
          ? _EditView(
              info: _editingInfo,
              onInfoChanged: (updated) =>
                  setState(() => _editingInfo = updated),
              nameController: _nameController,
              onSurface: onSurface,
            )
          : _ReadView(info: info, onSurface: onSurface),
    );
  }
}

// ── Read view ────────────────────────────────────────────────────────────────

class _ReadView extends StatelessWidget {
  final PersonalInfo info;
  final Color onSurface;

  const _ReadView({required this.info, required this.onSurface});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _Avatar(name: info.name),
        const SizedBox(height: 20),
        Text(
          info.name.isNotEmpty ? info.name : 'Anonymous',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: onSurface,
          ),
        ),
        if (info.gender != null) ...[
          const SizedBox(height: 4),
          Text(
            _genderLabel(info.gender!),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
        const SizedBox(height: 32),
        if (info.hasAnswers) ...[
          _SectionHeader(label: 'YOUR PROFILE', onSurface: onSurface),
          const SizedBox(height: 12),
          if (info.lifeStage != null)
            _InfoRow(
              icon: '📈',
              label: 'Career stage',
              value: _lifeStageLabel(info.lifeStage!),
              onSurface: onSurface,
            ),
          if (info.field != null)
            _InfoRow(
              icon: '💼',
              label: 'Field',
              value: _fieldLabel(info.field!),
              onSurface: onSurface,
            ),
          if (info.confidence != null)
            _InfoRow(
              icon: '🎯',
              label: 'Confidence',
              value: _confidenceLabel(info.confidence!),
              onSurface: onSurface,
            ),
          if (info.urgency != null)
            _InfoRow(
              icon: '⏱',
              label: 'Timeline',
              value: _urgencyLabel(info.urgency!),
              onSurface: onSurface,
            ),
          if (info.faith != null)
            _InfoRow(
              icon: '🕊',
              label: 'Faith',
              value: _faithLabel(info.faith!),
              onSurface: onSurface,
            ),
          if (info.interests.isNotEmpty) ...[
            const SizedBox(height: 24),
            _SectionHeader(label: 'INTERESTS', onSurface: onSurface),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: info.interests
                  .map((i) => _InterestChip(interest: i, onSurface: onSurface))
                  .toList(),
            ),
          ],
        ],
        const SizedBox(height: 32),
        _NotificationsSection(onSurface: onSurface),
        _TtsSection(onSurface: onSurface),
      ],
    );
  }

  static String _genderLabel(Gender g) => switch (g) {
    .male => 'Male',
    .female => 'Female',
    .nonbinary => 'Non-binary',
  };

  static String _lifeStageLabel(String s) => switch (s) {
    'new_grad' => 'Early career',
    'rising' => 'Rising professional',
    'established' => 'Established / Partner-track',
    'executive' => 'Executive / C-suite',
    _ => s,
  };
  static String _fieldLabel(String f) => switch (f) {
    'medicine' => 'Medicine',
    'law' => 'Law',
    'finance' => 'Finance / Consulting',
    'tech' => 'Tech / Engineering',
    'other' => 'Other',
    _ => f,
  };
  static String _confidenceLabel(String c) => switch (c) {
    'fish' => 'Fish out of water',
    'some' => 'Gaps in some areas',
    'mostly' => 'Mostly confident',
    _ => c,
  };
  static String _urgencyLabel(String u) => switch (u) {
    'now' => 'Something coming up',
    'building' => 'Next few months',
    'long' => 'Long game',
    _ => u,
  };
  static String _faithLabel(String f) => switch (f) {
    'central' => 'Central to my life',
    'private' => 'Private but important',
    'exploring' => 'Exploring',
    'secular' => 'Secular',
    _ => f,
  };
}

// ── Edit view ────────────────────────────────────────────────────────────────

class _EditView extends StatelessWidget {
  final PersonalInfo info;
  final void Function(PersonalInfo) onInfoChanged;
  final TextEditingController nameController;
  final Color onSurface;

  const _EditView({
    required this.info,
    required this.onInfoChanged,
    required this.nameController,
    required this.onSurface,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
      children: [
        for (final q in kQuizQuestions) ...[
          _QuestionSection(
            question: q,
            info: info,
            onInfoChanged: onInfoChanged,
            nameController: nameController,
            onSurface: onSurface,
          ),
          const SizedBox(height: 28),
        ],
      ],
    );
  }
}

class _QuestionSection extends StatelessWidget {
  final Map<String, dynamic> question;
  final PersonalInfo info;
  final void Function(PersonalInfo) onInfoChanged;
  final TextEditingController nameController;
  final Color onSurface;

  const _QuestionSection({
    required this.question,
    required this.info,
    required this.onInfoChanged,
    required this.nameController,
    required this.onSurface,
  });

  @override
  Widget build(BuildContext context) {
    final type = question['type'] as String;
    final id = question['id'] as String;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          label: question['label'] as String,
          onSurface: onSurface,
        ),
        const SizedBox(height: 6),
        Text(
          question['question'] as String,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: onSurface,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 14),
        if (type == 'text')
          TextField(
            controller: nameController,
            style: TextStyle(color: onSurface, fontSize: 15),
            decoration: InputDecoration(
              hintText: question['placeholder'] as String,
              hintStyle: TextStyle(color: onSurface.withValues(alpha: 0.4)),
              filled: true,
              fillColor: onSurface.withValues(alpha: 0.04),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: onSurface.withValues(alpha: 0.08),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: onSurface.withValues(alpha: 0.08),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: blue),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
            ),
          )
        else if (type == 'single')
          for (final opt in question['options'] as List<dynamic>)
            QuizSingleOptionTile(
              option: opt as Map<String, dynamic>,
              isSelected: quizGetAnswer(info, id) == opt['value'],
              onSurface: onSurface,
              onTap: () => onInfoChanged(
                quizSetAnswer(info, id, opt['value'] as String),
              ),
            )
        else if (type == 'multi')
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
            padding: EdgeInsets.zero,
            children: [
              for (final opt in question['options'] as List<dynamic>)
                QuizMultiGridItem(
                  option: opt as Map<String, dynamic>,
                  isSelected: info.interests.contains(opt['value']),
                  onSurface: onSurface,
                  onTap: () {
                    final val = opt['value'] as String;
                    final current = List<String>.from(info.interests);
                    if (current.contains(val)) {
                      current.remove(val);
                    } else {
                      current.add(val);
                    }
                    onInfoChanged(info.copyWith(interests: current));
                  },
                ),
            ],
          ),
      ],
    );
  }
}

// ── Sub-widgets ──────────────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  final String name;
  const _Avatar({required this.name});

  @override
  Widget build(BuildContext context) {
    final initials = name.isNotEmpty ? name[0].toUpperCase() : '?';
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [blue, deepBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: blue.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: const TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  final Color onSurface;
  const _SectionHeader({required this.label, required this.onSurface});

  @override
  Widget build(BuildContext context) => Text(
    label,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge,
  );
}

class _InfoRow extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final Color onSurface;
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onSurface,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 12),
              Text(label, style: textTheme.bodyLarge),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(value, style: textTheme.titleMedium),
            ),
          ),
        ],
      ),
    );
  }
}

class _InterestChip extends StatelessWidget {
  final String interest;
  final Color onSurface;

  static const _icons = {
    'wine': '🍷',
    'dining': '🍽',
    'fashion': '👔',
    'watches': '⌚',
    'cars': '🏎',
    'art': '🎨',
    'travel': '✈️',
    'golf': '⛳',
    'boats': '⛵',
    'fitness': '💪',
    'money': '💰',
    'philanthropy': '🤝',
  };
  static const _labels = {
    'wine': 'Wine & Spirits',
    'dining': 'Fine Dining',
    'fashion': 'Fashion',
    'watches': 'Watches',
    'cars': 'Cars',
    'art': 'Art',
    'travel': 'Travel',
    'golf': 'Golf & Clubs',
    'boats': 'Boating',
    'fitness': 'Fitness',
    'money': 'Investing',
    'philanthropy': 'Philanthropy',
  };

  const _InterestChip({required this.interest, required this.onSurface});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: onSurface.withValues(alpha: 0.06),
        border: Border.all(color: onSurface.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_icons[interest] ?? '✦', style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            _labels[interest] ?? interest,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Notifications Section ────────────────────────────────────────────────────

class _NotificationsSection extends StatelessWidget {
  final Color onSurface;
  const _NotificationsSection({required this.onSurface});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DependencyProvider.get<NotificationCubit>()..load(),
      child: _NotificationsSectionBody(onSurface: onSurface),
    );
  }
}

class _NotificationsSectionBody extends StatefulWidget {
  final Color onSurface;
  const _NotificationsSectionBody({required this.onSurface});

  @override
  State<_NotificationsSectionBody> createState() =>
      _NotificationsSectionBodyState();
}

class _NotificationsSectionBodyState extends State<_NotificationsSectionBody> {
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    _lifecycleListener = AppLifecycleListener(
      onResume: () =>
          context.read<NotificationCubit>().refreshPermissionStatus(),
    );
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NotificationCubit>().state;
    final cubit = context.read<NotificationCubit>();

    final onSurface = widget.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _SectionHeader(label: 'NOTIFICATIONS', onSurface: onSurface),
        const SizedBox(height: 12),
        _SettingsRow(
          isLoading: state.isLoading,
          icon: Icons.notifications_outlined,
          label: 'Daily fact',
          onSurface: onSurface,
          trailing: Switch(
            value: state.enabled,
            onChanged: (v) => cubit.setEnabled(v),
          ),
        ),
        _SettingsRow(
          isLoading: state.isLoading,
          icon: Icons.schedule_outlined,
          label: 'Time',
          onSurface: state.enabled
              ? onSurface
              : onSurface.withValues(alpha: 0.35),
          trailing: GestureDetector(
            onTap: state.enabled
                ? () => _pickTime(context, cubit, state.hour, state.minute)
                : null,
            child: Text(
              _formatTime(state.hour, state.minute),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: state.enabled ? blue : onSurface.withValues(alpha: 0.3),
              ),
            ),
          ),
        ),
        if (state.permissionDenied)
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Column(
              children: [
                Text(
                  'Permission denied — enable notifications in your device Settings.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(height: 6),
                TextButton(
                  onPressed: () => AppSettings.openAppSettings(
                    type: AppSettingsType.notification,
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Open Settings',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 32),
      ],
    );
  }

  Future<void> _pickTime(
    BuildContext context,
    NotificationCubit cubit,
    int currentHour,
    int currentMinute,
  ) async {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      var hour = currentHour;
      var minute = currentMinute;

      await showCupertinoModalPopup<void>(
        context: context,
        builder: (ctx) {
          final brightness = MediaQuery.platformBrightnessOf(ctx);
          return CupertinoTheme(
            data: CupertinoThemeData(brightness: brightness),
            child: Builder(
              builder: (themeCtx) => Container(
                height: 300,
                color: CupertinoColors.systemBackground.resolveFrom(themeCtx),
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CupertinoButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Done'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          initialDateTime: DateTime(
                            2024,
                            1,
                            1,
                            currentHour,
                            currentMinute,
                          ),
                          onDateTimeChanged: (dt) {
                            hour = dt.hour;
                            minute = dt.minute;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

      cubit.setTime(hour, minute);
    } else {
      final picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: currentHour, minute: currentMinute),
      );
      if (picked != null) cubit.setTime(picked.hour, picked.minute);
    }
  }

  String _formatTime(int hour, int minute) {
    final period = hour < 12 ? 'AM' : 'PM';
    final h = hour % 12 == 0 ? 12 : hour % 12;
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m $period';
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color onSurface;
  final Widget trailing;
  final bool isLoading;

  const _SettingsRow({
    required this.icon,
    required this.label,
    required this.onSurface,
    required this.trailing,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: onSurface.withValues(alpha: 0.6)),
          const SizedBox(width: 12),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: onSurface),
          ),
          const Spacer(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLoading
                ? SizedBox.shrink(
                    key: ValueKey("hide_${label}_trailing_widget"),
                  )
                : SizedBox(
                    key: ValueKey("show_${label}_trailing_widget"),
                    child: trailing,
                  ),
          ),
        ],
      ),
    );
  }
}

// ── TTS Section ───────────────────────────────────────────────────────────────

class _TtsSection extends StatefulWidget {
  final Color onSurface;
  const _TtsSection({required this.onSurface});

  @override
  State<_TtsSection> createState() => _TtsSectionState();
}

class _TtsSectionState extends State<_TtsSection> {
  late Future<List<ChapterSpeech>> _speechesFuture;

  @override
  void initState() {
    super.initState();
    _speechesFuture = DependencyProvider.get<TtsRepository>()
        .getAllChapterSpeeches();
  }

  @override
  Widget build(BuildContext context) {
    final ttsSettings = context.read<AppBloc>().state.userState.ttsSettings;
    final onSurface = widget.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _SectionHeader(label: 'TEXT TO SPEECH', onSurface: onSurface),
        const SizedBox(height: 12),
        if (ttsSettings == null)
          _NoVoiceCard(onSurface: onSurface)
        else ...[
          VoiceTile(
            item: VoicePreviewItem(voice: ttsSettings.voice),
            isSelected: true,
            trailing: IconButton(
              icon: Icon(
                Icons.edit_outlined,
                size: 18,
                color: onSurface.withValues(alpha: 0.5),
              ),
              onPressed: () => context.navigator.addPage(
                PageConfiguration.voiceSelection(ttsSettings.voice),
              ),
            ),
          ),
        ],
        const SizedBox(height: 20),
        FutureBuilder<List<ChapterSpeech>>(
          future: _speechesFuture,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final speeches = snap.data ?? [];
            if (speeches.isEmpty) {
              return Text(
                'No chapters have been generated yet.',
                style: TextStyle(
                  fontSize: 13,
                  color: onSurface.withValues(alpha: 0.45),
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GENERATED CHAPTERS',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    color: onSurface.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(height: 10),
                for (final speech in speeches) ...[
                  _ChapterSpeechTile(speech: speech, onSurface: onSurface),
                  const SizedBox(height: 8),
                ],
              ],
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _NoVoiceCard extends StatelessWidget {
  final Color onSurface;
  const _NoVoiceCard({required this.onSurface});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.navigator.addPage(PageConfiguration.voiceSelection(null)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: onSurface.withValues(alpha: 0.1)),
          color: onSurface.withValues(alpha: 0.03),
        ),
        child: Row(
          children: [
            Icon(
              Icons.record_voice_over_outlined,
              size: 22,
              color: onSurface.withValues(alpha: 0.35),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'No voice selected — tap to choose',
                style: TextStyle(
                  fontSize: 14,
                  color: onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: onSurface.withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChapterSpeechTile extends StatelessWidget {
  final ChapterSpeech speech;
  final Color onSurface;

  const _ChapterSpeechTile({required this.speech, required this.onSurface});

  @override
  Widget build(BuildContext context) {
    const String? minutes = null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: onSurface.withValues(alpha: 0.08)),
        color: onSurface.withValues(alpha: 0.02),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: blue.withValues(alpha: 0.1),
            ),
            alignment: Alignment.center,
            child: Text(
              speech.chapterId,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: blue,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chapter ${speech.chapterId}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: onSurface,
                  ),
                ),
                Text(
                  speech.voice.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: onSurface.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ),
          if (minutes != null)
            Text(
              minutes,
              style: TextStyle(
                fontSize: 12,
                color: onSurface.withValues(alpha: 0.4),
              ),
            )
          else
            Icon(
              Icons.audio_file_outlined,
              size: 18,
              color: onSurface.withValues(alpha: 0.3),
            ),
        ],
      ),
    );
  }
}
