import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:isar_community/isar.dart';

import 'app_seed_state_isar.dart';
import 'embedded_chunk_isar.dart';

class EmbeddedChunkSeedService {
  static const String _seedKey = 'embedded_chunks_seed_version';

  final Isar isar;

  EmbeddedChunkSeedService(this.isar);

  Future<void> ensureSeeded({
    required String assetPath,
    required String version,
    bool force = false,
  }) async {
    final existing = await isar.appSeedStateIsars
        .filter()
        .keyEqualTo(_seedKey)
        .findFirst();

    final alreadySeeded = existing?.value == version;

    if (alreadySeeded && !force) {
      return;
    }

    final raw = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(raw);

    if (decoded is! List) {
      throw Exception('Embedded chunks JSON must be a List');
    }

    final items = decoded
        .map((e) => EmbeddedChunkIsar.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    await isar.writeTxn(() async {
      if (force || !alreadySeeded) {
        await isar.embeddedChunkIsars.clear();
      }

      await isar.embeddedChunkIsars.putAll(items);

      final state = AppSeedStateIsar()
        ..key = _seedKey
        ..value = version;

      await isar.appSeedStateIsars.put(state);
    });
  }
}