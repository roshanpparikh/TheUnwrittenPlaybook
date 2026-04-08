import 'dart:async';
import 'dart:convert';

import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:isar_community/isar.dart';
import 'package:upwork_the_unwritten_playbook/isar/chat_message_isar.dart';

class IsarChatController with ScrollToMessageMixin implements ChatController {
  final Isar _isar;
  final _operationsController = StreamController<ChatOperation>.broadcast();

  List<Message>? _cachedMessages;
  final String? chapterId;

  IsarChatController(this._isar, this.chapterId);

  IsarCollection<ChatMessageIsar> get _col => _isar.chatMessageIsars;

  int _toEpoch(dynamic value) {
    if (value is int) return value;
    if (value is DateTime) return value.millisecondsSinceEpoch;
    return 0;
  }

  @override
  Future<void> insertMessage(Message message, {int? index}) async {
    final existing = await _col
        .where()
        .messageIdEqualTo(message.id)
        .findFirst();

    if (existing != null) return;

    final ts = _toEpoch(message.createdAt);

    final sortedMessages = messages;
    final insertAt = sortedMessages.indexWhere((m) {
      final mts = _toEpoch(m.createdAt);
      return ts < mts;
    });

    final actualIndex = insertAt == -1 ? sortedMessages.length : insertAt;

    await _isar.writeTxn(() async {
      await _col.put(
        ChatMessageIsar()
          ..chapterId = chapterId
          ..messageId = message.id
          ..createdAt = ts
          ..jsonData = jsonEncode(message.toJson()),
      );
    });

    _invalidateCache();
    _operationsController.add(ChatOperation.insert(message, actualIndex));
  }

  Future<void> toggleLoadingMessage(
    Message loadingMessage, {
    Message? resultMessage,
  }) async {
    print("--- toggleLoadingMessage Start ---");

    // 1. Get current messages.
    // NOTE: If your logs still show index -1, you need to store 'loadingMessage'
    // in a separate list or ensure _invalidateCache() isn't called mid-stream.
    final currentMessages = List<Message>.from(messages);
    final loadingIndex = currentMessages.indexWhere(
      (m) => m.id == loadingMessage.id,
    );

    // --- PHASE A: Finish Loading (REPLACE) ---
    if (resultMessage != null) {
      print(
        "[PHASE A] Result received. Attempting Replace at index: $loadingIndex",
      );

      // Persist real message to Isar
      final realTs = _toEpoch(resultMessage.createdAt);
      await _isar.writeTxn(() async {
        await _col.put(
          ChatMessageIsar()
            ..chapterId = chapterId
            ..messageId = resultMessage.id
            ..createdAt = realTs
            ..jsonData = jsonEncode(resultMessage.toJson()),
        );
      });

      if (loadingIndex != -1) {
        // THE REPLACE LOGIC
        currentMessages[loadingIndex] = resultMessage;
        _cachedMessages = List.from(currentMessages);

        // Emit a single UPDATE operation instead of Remove/Insert
        _operationsController.add(
          ChatOperation.update(loadingMessage, resultMessage, loadingIndex),
        );
        print("[PHASE A] Successfully REPLACED fake with real.");
      } else {
        // FALLBACK: If the fake message was lost due to cache wipe, we must Insert
        print(
          "[PHASE A] WARNING: Fake message missing from cache. Falling back to Insert.",
        );
        final insertAt = currentMessages.indexWhere(
          (m) => _toEpoch(m.createdAt) > realTs,
        );
        final actualIndex = insertAt == -1 ? currentMessages.length : insertAt;

        currentMessages.insert(actualIndex, resultMessage);
        _cachedMessages = currentMessages;
        _operationsController.add(
          ChatOperation.insert(resultMessage, actualIndex),
        );
      }
      return;
    }

    // --- PHASE B: Start Loading (INSERT FAKE) ---
    if (loadingIndex == -1) {
      final ts = _toEpoch(loadingMessage.createdAt);
      final insertAt = currentMessages.indexWhere(
        (m) => _toEpoch(m.createdAt) > ts,
      );
      final actualIndex = insertAt == -1 ? currentMessages.length : insertAt;

      currentMessages.insert(actualIndex, loadingMessage);
      _cachedMessages = currentMessages;
      _operationsController.add(
        ChatOperation.insert(loadingMessage, actualIndex),
      );
      print("[PHASE B] Fake message inserted at index: $actualIndex");
    }
  }

  void addChatOperation(ChatOperation operation) =>
      _operationsController.add(operation);

  @override
  Future<void> removeMessage(Message message) async {
    final sortedMessages = List.from(messages);
    final index = sortedMessages.indexWhere((m) => m.id == message.id);

    if (index != -1) {
      final messageToRemove = sortedMessages[index] as Message;
      await _isar.writeTxn(() async {
        await _col.where().messageIdEqualTo(messageToRemove.id).deleteFirst();
      });
      _invalidateCache();
      _operationsController.add(ChatOperation.remove(messageToRemove, index));
    }
  }

  @override
  Future<void> updateMessage(Message oldMessage, Message newMessage) async {
    final sortedMessages = List.from(messages);
    final index = sortedMessages.indexWhere((m) => m.id == oldMessage.id);

    if (index != -1) {
      final actualOldMessage = sortedMessages[index] as Message;
      if (actualOldMessage == newMessage) return;

      await _isar.writeTxn(() async {
        final record = await _col
            .where()
            .messageIdEqualTo(actualOldMessage.id)
            .findFirst();
        if (record != null) {
          record
            ..createdAt = _toEpoch(newMessage.createdAt)
            ..jsonData = jsonEncode(newMessage.toJson());
          await _col.put(record);
        }
      });

      _invalidateCache();
      _operationsController.add(
        ChatOperation.update(actualOldMessage, newMessage, index),
      );
    }
  }

  @override
  Future<void> setMessages(List<Message> messages) async {
    await _isar.writeTxn(() async {
      await _col.clear();
      if (messages.isNotEmpty) {
        await _col.putAll(_toIsarList(messages));
      }
    });

    _invalidateCache();
    _operationsController.add(ChatOperation.set(_sorted(messages)));
  }

  @override
  Future<void> insertAllMessages(List<Message> messages, {int? index}) async {
    if (messages.isEmpty) return;

    final originalLength = await _col.count();

    await _isar.writeTxn(() async {
      await _col.putAll(_toIsarList(messages));
    });

    _invalidateCache();
    _operationsController.add(
      ChatOperation.insertAll(_sorted(messages), originalLength),
    );
  }

  List<ChatMessageIsar> _toIsarList(List<Message> msgs) => msgs
      .map(
        (m) => ChatMessageIsar()

          ..messageId = m.id
          ..createdAt = _toEpoch(m.createdAt)
          ..jsonData = jsonEncode(m.toJson()),
      )
      .toList();

  void _invalidateCache() {
    _cachedMessages = null;
  }

  List<Message> get cachedMessages => List.of(_cachedMessages ?? []);

  @override
  List<Message> get messages {
    if (_cachedMessages != null) return _cachedMessages!;

    final records = chapterId == null
        ? _col.where().anyIsarId().sortByCreatedAt().findAllSync()
        : _col.where().anyIsarId()
              .filter()
              .chapterIdEqualTo(chapterId)
              .sortByCreatedAt()
              .findAllSync();


    _cachedMessages = records.map((r) {

      final json = Map<String, dynamic>.from(jsonDecode(r.jsonData) as Map);
      return Message.fromJson(json).copyWith(metadata: {
        'chapterId': r.chapterId
      });
    }).toList();

    return _cachedMessages!;
  }

  List<Message> _sorted(List<Message> msgs) {
    return List.of(msgs)..sort((a, b) {
      final aTs = _toEpoch(a.createdAt);
      final bTs = _toEpoch(b.createdAt);
      return aTs.compareTo(bTs);
    });
  }

  @override
  Stream<ChatOperation> get operationsStream => _operationsController.stream;

  @override
  void dispose() {
    _operationsController.close();
    disposeScrollMethods();
  }
}
