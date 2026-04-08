import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:upwork_the_unwritten_playbook/core/logger/app_logger.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/chapter_content_dto.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/chapter_dto.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/glossary_term_dto.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_model.dart';

import '../glossary_data.dart';
import '../playbook_data.dart';
import '../quiz_data.dart';
import '../../domain/models/chapter_content_model.dart';
import '../../domain/models/playbook_part.dart';
import '../../domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final AppLogger _appLogger;

  BookRepositoryImpl(this._appLogger) {
    debugPrint('BookRepositoryImpl: instance created.');
    unawaited(_preloadAll());
  }

  static const _chapterContentAssetPath = 'assets/json/chapter_content.json';
  static const _chaptersAssetPath = 'assets/json/playbook_chapters.json';
  static const _glossaryAssetPath = 'assets/json/glossary.json';

  static Map<int, Map<String, dynamic>>? _chapterContentCache;
  static List<ChapterModel>? _chaptersCache;
  static List<GlossaryTerm>? _glossaryCache;

  Future<void> _preloadAll() async {
    debugPrint(
      'BookRepositoryImpl: preload started for chapters, chapter content, glossary, and tips.',
    );

    try {
      await Future.wait([
        _loadChapters(),
        _loadChapterContent(),
        _loadGlossary(),
      ]);

      debugPrint('BookRepositoryImpl: preload completed successfully.');
    } catch (e, stackTrace) {
      _appLogger.e(
        'BookRepositoryImpl: preload failed.',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<Map<int, Map<String, dynamic>>> _loadChapterContent() async {
    final cached = _chapterContentCache;
    if (cached != null) {
      debugPrint(
        'BookRepositoryImpl._loadChapterContent: cache hit (${cached.length})',
      );
      return cached;
    }

    debugPrint(
      'BookRepositoryImpl._loadChapterContent: loading asset $_chapterContentAssetPath',
    );

    try {
      final jsonString = await rootBundle.loadString(_chapterContentAssetPath);

      final decoded = jsonDecode(jsonString);

      if (decoded is! Map) {
        throw FormatException(
          'chapter_content.json root must be an object/map.',
        );
      }

      final map = <int, Map<String, dynamic>>{};
      for (final entry in decoded.entries) {
        final keyInt = int.tryParse(entry.key.toString());
        if (keyInt == null) continue;

        final value = entry.value;
        if (value is Map) {
          map[keyInt] = value.cast<String, dynamic>();
        }
      }

      _chapterContentCache = map;

      debugPrint(
        'BookRepositoryImpl._loadChapterContent: loaded ${map.length} chapters',
      );

      return map;
    } catch (e, stackTrace) {
      _appLogger.e(
        'BookRepositoryImpl._loadChapterContent failed',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<List<ChapterModel>> _loadChapters() async {
    final cached = _chaptersCache;
    if (cached != null) {
      debugPrint(
        'BookRepositoryImpl._loadChapters: cache hit (${cached.length})',
      );
      return cached;
    }

    debugPrint(
      'BookRepositoryImpl._loadChapters: loading asset $_chaptersAssetPath',
    );

    try {
      final jsonString = await rootBundle.loadString(_chaptersAssetPath);
      final decoded = jsonDecode(jsonString);

      if (decoded is! List) {
        throw const FormatException(
          'playbook_chapters.json root must be a list.',
        );
      }

      final chapters = decoded
          .whereType<Map>()
          .map((m) => ChapterDto.fromJson(m.cast<String, dynamic>()).toModel())
          .toList();

      _chaptersCache = chapters;

      debugPrint(
        'BookRepositoryImpl._loadChapters: loaded ${chapters.length} chapters',
      );

      return chapters;
    } catch (e, stackTrace) {
      _appLogger.e(
        'BookRepositoryImpl._loadChapters failed',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<ChapterModel>> getChapters() async {
    debugPrint('BookRepositoryImpl.getChapters()');
    return _loadChapters();
  }

  @override
  Future<ChapterContentModel?> getChapterContent(int chapterNumber) async {
    debugPrint(
      'BookRepositoryImpl.getChapterContent($chapterNumber)',
    );

    final contentMap = await _loadChapterContent();
    final raw = contentMap[chapterNumber];

    if (raw == null) {
      debugPrint('No content for chapter $chapterNumber');
      return null;
    }

    final dto = ChapterContentDto.fromMap(raw);
    return dto.toModel();
  }

  @override
  List<PlaybookPart> getParts() {
    debugPrint('BookRepositoryImpl.getParts()');

    return playbookParts
        .map(
          (p) => PlaybookPart(
            id: p['id']!,
            number: p['n']!,
            title: p['t']!,
            subtitle: p['s']!,
          ),
        )
        .toList();
  }

  Future<List<GlossaryTerm>> _loadGlossary() async {
    final cached = _glossaryCache;
    if (cached != null) {
      debugPrint(
        'BookRepositoryImpl._loadGlossary: cache hit (${cached.length})',
      );
      return cached;
    }

    debugPrint(
      'BookRepositoryImpl._loadGlossary: loading asset $_glossaryAssetPath',
    );

    final jsonString = await rootBundle.loadString(_glossaryAssetPath);
    final decoded = jsonDecode(jsonString);

    if (decoded is! List) {
      throw const FormatException('glossary.json root must be a list.');
    }

    final terms = decoded
        .whereType<Map>()
        .map(
          (m) => GlossaryTermDto.fromJson(m.cast<String, dynamic>()).toModel(),
        )
        .toList();

    _glossaryCache = terms;

    debugPrint(
      'BookRepositoryImpl._loadGlossary: loaded ${terms.length} terms',
    );

    return terms;
  }

  @override
  Future<List<GlossaryTerm>> getGlossaryTerms() {
    debugPrint('BookRepositoryImpl.getGlossaryTerms()');
    return _loadGlossary();
  }

  @override
  List<QuizQuestion> getQuizQuestions() {
    debugPrint(
      'BookRepositoryImpl.getQuizQuestions (${quizQuestions.length})',
    );
    return quizQuestions;
  }
}