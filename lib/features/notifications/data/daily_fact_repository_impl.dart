import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/data/daily_fact.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification/app_notification.dart';

import '../domain/daily_fact_repository.dart';

class DailyFactRepositoryImpl implements DailyFactRepository {
  static List<DailyFact>? _cache;
  static const _notificationId = 0;
  static const _kShownFacts = 'daily_facts.shown_ids';
  static const _kLastScheduledFact = 'daily_facts.last_scheduled';

  DailyFactRepositoryImpl() {
    _preload();
  }

  Future<void> _preload() async {
    if (_cache != null) return;
    try {
      final raw = await rootBundle.loadString('assets/json/daily_facts.json');
      _cache = (jsonDecode(raw) as List)
          .map((e) => DailyFact.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      _cache = [];
    }
  }

  Future<Set<String>> _getShownIds() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kShownFacts);
    if (raw == null) return {};
    try {
      return (jsonDecode(raw) as List).cast<String>().toSet();
    } catch (_) {
      return {};
    }
  }

  @override
  Future<void> factShown(String factId) async {
    final prefs = await SharedPreferences.getInstance();
    final shown = await _getShownIds();
    shown.add(factId);
    await prefs.setString(_kShownFacts, jsonEncode(shown.toList()));
  }

  /// Clears the history of shown facts from SharedPreferences
  Future<void> clearShownHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kShownFacts);
  }

  @override
  Future<List<DailyFact>> getShownFacts() async {
    if (_cache == null) await _preload();
    final facts = _cache ?? [];
    final shownIds = (await _getShownIds()).toList(); // insertion order = oldest first
    final factById = {for (final f in facts) f.id: f};
    return shownIds.reversed
        .map((id) => factById[id])
        .whereType<DailyFact>()
        .toList();
  }

  @override
  Future<void> saveLastScheduledFact(DailyFact fact, int hour, int minute) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kLastScheduledFact,
      jsonEncode({'fact': fact.toJson(), 'hour': hour, 'minute': minute}),
    );
  }

  @override
  Future<DailyFact?> getElapsedScheduledFact() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kLastScheduledFact);
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final hour = map['hour'] as int;
      final minute = map['minute'] as int;
      final now = DateTime.now();
      final scheduledToday = DateTime(now.year, now.month, now.day, hour, minute);
      if (now.isBefore(scheduledToday)) return null;
      return DailyFact.fromJson(map['fact'] as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<DailyFactNotification?> factForToday(List<String> interests) async {
    if (_cache == null) await _preload();
    final facts = _cache ?? [];
    if (facts.isEmpty) return null;

    // 1. Determine the initial pool based on interests
    final pool = interests.isEmpty
        ? facts
        : facts.where((f) => f.interests.any(interests.contains)).toList();

    // If interests provided but none match any facts, fallback to all facts
    final candidates = pool.isEmpty ? facts : pool;

    final shownIds = await _getShownIds();
    
    // 2. Find unseen facts within the interest-based pool
    var unseen = candidates.where((f) => !shownIds.contains(f.id)).toList();

    // 3. Fallback: If all facts in the interest pool have been seen, 
    // check if there are ANY unseen facts globally
    if (unseen.isEmpty) {
      unseen = facts.where((f) => !shownIds.contains(f.id)).toList();
    }

    // 4. Final Fallback: If every single fact in the database has been seen, 
    // reset the pool to the original interest-based candidates
    if (unseen.isEmpty) {
      unseen = candidates;
      await clearShownHistory();
    }

    final fact = unseen[Random().nextInt(unseen.length)];

    return DailyFactNotification(
      id: _notificationId,
      hour: 9,
      minute: 0,
      fact: fact,
    );
  }
}