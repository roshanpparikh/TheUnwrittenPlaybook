final class DailyFact {
  final String id;
  final String pushBody;
  final String fullBody;
  final List<String> interests;

  const DailyFact({
    required this.id,
    required this.pushBody,
    required this.fullBody,
    required this.interests,
  });

  String get title {
    if (interests.isEmpty) return 'Daily fact';

    final interest = interests.first;
    final label = interest[0].toUpperCase() + interest.substring(1);

    return 'Daily fact · $label';
  }

  factory DailyFact.fromJson(Map<String, dynamic> json) => DailyFact(
        id: json['id'] as String,
        pushBody: json['pushBody'] as String,
        fullBody: json['fullBody'] as String,
        interests: (json['interests'] as List).cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pushBody': pushBody,
        'fullBody': fullBody,
        'interests': interests,
      };
}