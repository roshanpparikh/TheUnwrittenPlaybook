import 'package:upwork_the_unwritten_playbook/features/notifications/data/daily_fact.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification/app_notification.dart';

abstract interface class DailyFactRepository {
  Future<DailyFactNotification?> factForToday(List<String> interests);
  Future<void> factShown(String factId);

  /// Returns facts the user has already seen (tapped), newest first.
  Future<List<DailyFact>> getShownFacts();

  /// Persists the last scheduled notification fact and its time so it can be
  /// surfaced in the Facts tab even if the user never tapped the notification.
  Future<void> saveLastScheduledFact(DailyFact fact, int hour, int minute);

  /// Returns the last scheduled fact if its scheduled time has already passed
  /// today, otherwise null.
  Future<DailyFact?> getElapsedScheduledFact();
}
