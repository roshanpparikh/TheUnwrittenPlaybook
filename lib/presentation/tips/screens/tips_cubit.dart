import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc_utils/user_state_listener_mixin.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/repository/tips_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/user_state_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/data/daily_fact.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/daily_fact_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/notification_settings_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_service.dart';

// ── State ─────────────────────────────────────────────────────────────────────

sealed class TipsState {
  const TipsState();
}

class TipsLoading extends TipsState {
  const TipsLoading();
}

class TipsLoaded extends TipsState {
  final int? lastChapterId;
  final List<TipModel> tips;
  final List<DailyFact> facts;
  final bool factsLoading;
  final Set<String> selectedInterests;

  final bool notificationsEnabled;

  const TipsLoaded(
    this.tips,
    this.lastChapterId, {
    this.facts = const [],
    this.factsLoading = false,
    this.selectedInterests = const {},
    this.notificationsEnabled = true,
  });

  /// All distinct interest tags present across the loaded facts.
  List<String> get availableInterests {
    final seen = <String>{};
    for (final f in facts) {
      seen.addAll(f.interests);
    }
    return seen.toList()..sort();
  }

  /// Facts filtered by [selectedInterests]. If none selected, returns all.
  List<DailyFact> get filteredFacts {
    if (selectedInterests.isEmpty) return facts;
    return facts.where((f) => f.interests.any(selectedInterests.contains)).toList();
  }

  TipsLoaded copyWith({
    int? lastChapterId,
    List<TipModel>? tips,
    List<DailyFact>? facts,
    bool? factsLoading,
    Set<String>? selectedInterests,
    bool? notificationsEnabled,
  }) => TipsLoaded(
    tips ?? this.tips,
    lastChapterId ?? this.lastChapterId,
    facts: facts ?? this.facts,
    factsLoading: factsLoading ?? this.factsLoading,
    selectedInterests: selectedInterests ?? this.selectedInterests,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
  );
}

class TipsError extends TipsState {
  final String message;
  const TipsError(this.message);
}

// ── Cubit ─────────────────────────────────────────────────────────────────────

class TipsCubit extends Cubit<TipsState> with UserStateListenerMixin {
  @override
  final UserRepository userRepository;
  final TipsRepository _repository;
  final BookRepository _bookRepository;
  final DailyFactRepository _factRepository;
  final NotificationService _notificationService;
  final NotificationSettingsRepository _settingsRepository;

  TipsCubit(
    this._repository,
    this.userRepository,
    this._bookRepository,
    this._factRepository,
    this._notificationService,
    this._settingsRepository,
  ) : super(const TipsLoading()) {
    _repository.tips.addListener(_onTipsChanged);
    _init();
    initUserStateListener();
  }

  void _onTipsChanged() {
    final s = state;
    if (isClosed) return;
    if (s is! TipsLoaded) return;
    emit(s.copyWith(tips: _repository.tips.value));
  }

  Future<void> _init() async {
    try {
      final settings = await _settingsRepository.getSettings();
      emit(TipsLoaded(
        _repository.tips.value,
        userRepository.currentUser.value.lastChapter,
        notificationsEnabled: settings.enabled,
      ));
      if (!userRepository.currentUser.value.isStub) {
        loadTips();
      }
      loadFacts();
    } catch (e) {
      emit(TipsError(e.toString()));
    }
  }

  Future<void> loadTips() async {
    final s = state;
    if (s is! TipsLoaded) return;
    final lastChapterId = s.lastChapterId;
    String? chapterText;
    if (lastChapterId != null) {
      final chapterContent = await _bookRepository.getChapterContent(lastChapterId);
      if (chapterContent != null) {
        chapterText = _buildChapterText(chapterContent);
      }
    }
    await _repository.init(lastChapterId, chapterText);
  }

  Future<void> loadFacts() async {
    final s = state;
    if (s is! TipsLoaded) return;
    emit(s.copyWith(factsLoading: true));

    final shownFacts = await _factRepository.getShownFacts();
    DailyFact? elapsedFact = await _factRepository.getElapsedScheduledFact();

    // Fallback for users who had a notification scheduled before saveLastScheduledFact
    // was introduced: read the payload from the pending OS notification directly.
    if (elapsedFact == null) {
      final pending = await _notificationService.getPendingDailyFact();
      if (pending != null) {
        final now = DateTime.now();
        final scheduledToday = DateTime(now.year, now.month, now.day, pending.hour, pending.minute);
        if (now.isAfter(scheduledToday)) {
          elapsedFact = pending.fact;
        }
      }
    }

    final settings = await _settingsRepository.getSettings();

    final List<DailyFact> facts;
    final elapsed = elapsedFact;
    if (elapsed != null && !shownFacts.any((f) => f.id == elapsed.id)) {
      await _factRepository.factShown(elapsed.id);
      facts = [elapsed, ...shownFacts];

      // Reschedule with a new fact so tomorrow's notification isn't the same one.
      if (settings.enabled) {
        final interests = userRepository.currentUser.value.personalInfo.interests;
        final next = await _factRepository.factForToday(interests);
        if (next != null) {
          final scheduled = next.copyWith(hour: settings.hour, minute: settings.minute);
          await _factRepository.saveLastScheduledFact(scheduled.fact, scheduled.hour, scheduled.minute);
          await _notificationService.scheduleDaily(scheduled);
        }
      }
    } else {
      facts = shownFacts;
    }

    if (isClosed) return;
    final updated = state;
    if (updated is! TipsLoaded) return;

    emit(updated.copyWith(
      facts: facts,
      factsLoading: false,
      notificationsEnabled: settings.enabled,
    ));
  }

  void toggleFactInterest(String interest) {
    final s = state;
    if (s is! TipsLoaded) return;
    final updated = Set<String>.of(s.selectedInterests);
    if (updated.contains(interest)) {
      updated.remove(interest);
    } else {
      updated.add(interest);
    }
    emit(s.copyWith(selectedInterests: updated));
  }

  @override
  Future<void> close() {
    _repository.tips.removeListener(_onTipsChanged);
    return super.close();
  }

  @override
  void onCurrentUserChanged(UserStateModel user) {
    final lastChapterId = userRepository.currentUser.value.lastChapter;
    final s = state;
    if (s is TipsLoaded) {
      emit(s.copyWith(lastChapterId: lastChapterId));
    }
  }
}

String _buildChapterText(ChapterContentModel c) {
  final buf = StringBuffer();

  for (final s in c.sections) {
    buf.writeln('## ${s.title}');
    buf.writeln(s.body);
    buf.writeln();
  }

  if (c.keyTerms.isNotEmpty) {
    buf.writeln('## Key Terms');
    for (final kt in c.keyTerms) {
      buf.writeln('${kt.term}: ${kt.definition}');
    }
    buf.writeln();
  }

  if (c.theMove.isNotEmpty) {
    buf.writeln('## The Move');
    buf.writeln(c.theMove);
    buf.writeln();
  }

  if (c.cheatSheet.isNotEmpty) {
    buf.writeln('## Cheat Sheet');
    for (final line in c.cheatSheet) {
      buf.writeln('- $line');
    }
  }

  return buf.toString();
}
