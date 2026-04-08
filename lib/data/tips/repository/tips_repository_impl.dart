import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/tip_dto.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/source/local_tip_source.dart';
import 'package:upwork_the_unwritten_playbook/data/tips/source/remote_tip_source.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';
import 'package:upwork_the_unwritten_playbook/isar/embedded_chunk_repository.dart';

import 'tips_repository.dart';

const _defaultTipsAssetPath = 'assets/json/tips.json';

class TipsRepositoryImpl implements TipsRepository {
  final LocalTipSource _local;
  final RemoteTipSource _remote;

  TipsRepositoryImpl({
    required LocalTipSource local,
    required RemoteTipSource remote,
    required EmbeddedChunkRepository embeddedChunkRepository,
  })  : _local = local,
        _remote = remote;

  final ValueNotifier<List<TipModel>> _tips =
  ValueNotifier<List<TipModel>>(<TipModel>[]);

  @override
  ValueListenable<List<TipModel>> get tips => _tips;

  @override
  Future<void> init(int? lastChapterId, String? chapterContent) async {
    debugPrint(
      'TipsRepository.init: start, '
          'lastChapterId=$lastChapterId, '
          'hasChapterContent=${chapterContent != null}, '
          'chapterContentLength=${chapterContent?.length ?? 0}',
    );

    final cached = await _local.loadTips();

    debugPrint(
      'TipsRepository.init: loaded cached tips, count=${cached.length}',
    );

    if (cached.isNotEmpty) {
      final first = cached.first;
      debugPrint(
        'TipsRepository.init: first cached tip -> '
            'type=${first.type.name}, '
            'label=${first.label}, '
            'generatedAtMs=${first.generatedAtMs}, '
            'forChapterId=${first.forChapterId}',
      );

      _tips.value = cached;
      debugPrint(
        'TipsRepository.init: assigned cached tips to notifier',
      );
    } else {
      debugPrint('TipsRepository.init: no cached tips found');
    }

    if (lastChapterId == null || chapterContent == null) {
      debugPrint(
        'TipsRepository.init: missing chapter context, '
            'lastChapterId=$lastChapterId, '
            'chapterContentIsNull=${chapterContent == null}. '
            'Falling back to cached or defaults.',
      );
      await _setCachedOrDefaults(cached);
      debugPrint('TipsRepository.init: finished via cached/default fallback');
      return;
    }

    DateTime? lastGenDate;
    int? lastGenChapter;

    if (cached.isNotEmpty) {
      lastGenDate =
          DateTime.fromMillisecondsSinceEpoch(cached.first.generatedAtMs);
      lastGenChapter = cached.first.forChapterId;

      debugPrint(
        'TipsRepository.init: derived cache metadata -> '
            'lastGenDate=$lastGenDate, '
            'lastGenChapter=$lastGenChapter',
      );
    } else {
      debugPrint(
        'TipsRepository.init: cache metadata unavailable because cached list is empty',
      );
    }

    if (lastGenChapter == lastChapterId) {
      debugPrint(
        'TipsRepository.init: skip generation because '
            'lastGenChapter == lastChapterId ($lastChapterId). '
            'Using cached/default fallback.',
      );
      await _setCachedOrDefaults(cached);
      debugPrint(
        'TipsRepository.init: finished after same-chapter shortcut',
      );
      return;
    }

    if (lastGenDate != null && _isToday(lastGenDate)) {
      debugPrint(
        'TipsRepository.init: skip generation because tips were already generated today '
            '($lastGenDate). Using cached/default fallback.',
      );
      await _setCachedOrDefaults(cached);
      debugPrint(
        'TipsRepository.init: finished after same-day shortcut',
      );
      return;
    }

    debugPrint(
      'TipsRepository.init: generating fresh tips for '
          'chapterId=$lastChapterId, '
          'chapterContentLength=${chapterContent.length}',
    );

    await _generateStoreOrFallback(
      chapterId: lastChapterId,
      chapterContent: chapterContent,
      cached: cached,
    );

    debugPrint(
      'TipsRepository.init: generation/fallback flow completed, '
          'currentTipsCount=${_tips.value.length}',
    );
  }
  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  Future<void> _generateStoreOrFallback({
    required int chapterId,
    required String chapterContent,
    required List<TipModel> cached,
  }) async {
    try {
      final newTips = await _remote.generateTips(chapterContent);
      final generatedAt = DateTime.now().millisecondsSinceEpoch;

      final newTipsModel = newTips
          .map(
            (tip) => TipModel(
          type: TipType.values.byName(tip.type),
          label: tip.label,
          content: tip.content,
          generatedAtMs: generatedAt,
          forChapterId: chapterId,
        ),
      )
          .toList();

      if (newTipsModel.isEmpty) {
        await _setCachedOrDefaults(cached);
        return;
      }

      await _local.saveTips(newTipsModel);
      _tips.value = newTipsModel;
    } catch (e, st) {
      debugPrintStack(label: e.toString(), stackTrace: st);
      await _setCachedOrDefaults(cached);
    }
  }

  Future<void> _setCachedOrDefaults(List<TipModel> cached) async {
    if (cached.isNotEmpty) {
      _tips.value = cached;
      return;
    }

    final defaults = await _loadDefaultTips();
    _tips.value = defaults;
  }

  Future<List<TipModel>> _loadDefaultTips() async {
    final current = _tips.value;
    if (current.isNotEmpty) {
      debugPrint('TipsRepository._loadDefaultTips: already has ${current.length} tips');
      return current;
    }

    debugPrint(
      'TipsRepository._loadDefaultTips: loading asset $_defaultTipsAssetPath',
    );

    final jsonString = await rootBundle.loadString(_defaultTipsAssetPath);
    final decoded = jsonDecode(jsonString);

    if (decoded is! List) {
      throw const FormatException('tips.json root must be a list.');
    }

    final generatedAtMs = DateTime.now().millisecondsSinceEpoch;

    final tips = decoded
        .whereType<Map>()
        .map((m) {
      final dto = TipDto.fromJson(m.cast<String, dynamic>());
      return TipModel(
        type: TipType.values.byName(dto.type),
        label: dto.label,
        content: dto.content,
        generatedAtMs: generatedAtMs,
        forChapterId: -1,
      );
    })
        .toList();

    _tips.value = tips;

    debugPrint(
      'TipsRepository._loadDefaultTips: loaded ${tips.length} tips',
    );

    return tips;
  }
}