import 'package:isar_community/isar.dart';

part 'chat_message_isar.g.dart';

@collection
class ChatMessageIsar {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String messageId;

  /// Epoch milliseconds — used for sorting
  @Index()
  late int createdAt;

  /// Full message serialized as JSON string
  late String jsonData;

  @Index()
  String? chapterId;
}
