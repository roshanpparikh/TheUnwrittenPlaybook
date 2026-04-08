part of 'app_notification.dart';

final class DailyFactNotification extends AppNotification {
  const DailyFactNotification({
    required super.id,
    required this.hour,
    required this.minute,
    required this.fact,
  }) : super(type: AppNotificationType.dailyFact);

  final DailyFact fact;
  final int hour;
  final int minute;

  /// Long-form text shown on the in-app detail screen.
  String get fullBody => fact.fullBody;

  @override
  String get title => fact.title;

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'id': id,
      'hour': hour,
      'minute': minute,
      'fact': fact.toJson(),
    };
  }

  @override
  String toPayload() => jsonEncode(toJson());

  factory DailyFactNotification.fromPayload(String payload) {
    final json = jsonDecode(payload) as Map<String, dynamic>;
    return DailyFactNotification.fromJson(json);
  }

  factory DailyFactNotification.fromJson(Map<String, dynamic> json) {
    return DailyFactNotification(
      id: json['id'] as int,
      hour: json['hour'] as int,
      minute: json['minute'] as int,
      fact: DailyFact.fromJson(json['fact'] as Map<String, dynamic>),
    );
  }

  DailyFactNotification copyWith({
    int? id,
    int? hour,
    int? minute,
    DailyFact? fact,
  }) {
    return DailyFactNotification(
      id: id ?? this.id,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      fact: fact ?? this.fact,
    );
  }
  
  @override
  String get body => fact.pushBody;
}