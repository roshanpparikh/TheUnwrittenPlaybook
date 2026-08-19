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

  static Future<Map<int, Map<String, dynamic>>>? _chapterContentFuture;
  static Future<List<ChapterModel>>? _chaptersFuture;
  static Future<List<GlossaryTerm>>? _glossaryFuture;


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

  Future<Map<int, Map<String, dynamic>>> _loadChapterContent() {
    final cached = _chapterContentCache;
    if (cached != null) {
      debugPrint(
        'BookRepositoryImpl._loadChapterContent: '
            'cache hit (${cached.length})',
      );
      return Future.value(cached);
    }

    return _chapterContentFuture ??= _readChapterContent();
  }

  Future<Map<int, Map<String, dynamic>>> _readChapterContent() async {
    debugPrint(
      'BookRepositoryImpl._readChapterContent: '
          'loading asset $_chapterContentAssetPath',
    );

    try {
      final jsonString = await rootBundle.loadString(
        _chapterContentAssetPath,
      );

      final decoded = jsonDecode(jsonString);

      if (decoded is! Map) {
        throw const FormatException(
          'chapter_content.json root must be an object/map.',
        );
      }

      final content = <int, Map<String, dynamic>>{};

      for (final entry in decoded.entries) {
        final chapterNumber = int.tryParse(entry.key.toString());
        if (chapterNumber == null) continue;

        final value = entry.value;
        if (value is Map) {
          content[chapterNumber] = value.cast<String, dynamic>();
        }
      }

      _chapterContentCache = content;

      debugPrint(
        'BookRepositoryImpl._readChapterContent: '
            'loaded ${content.length} chapters',
      );

      return content;
    } catch (error, stackTrace) {
      _chapterContentFuture = null;

      _appLogger.e(
        'BookRepositoryImpl._readChapterContent failed',
        error: error,
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }

  Future<List<ChapterModel>> _readChapters() async {
    debugPrint(
      'BookRepositoryImpl._readChapters: '
          'loading asset $_chaptersAssetPath',
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
          .map(
            (map) => ChapterDto.fromJson(
          map.cast<String, dynamic>(),
        ).toModel(),
      )
          .toList(growable: false);

      _chaptersCache = chapters;

      debugPrint(
        'BookRepositoryImpl._readChapters: '
            'loaded ${chapters.length} chapters',
      );

      return chapters;
    } catch (error, stackTrace) {
      _chaptersFuture = null;

      _appLogger.e(
        'BookRepositoryImpl._readChapters failed',
        error: error,
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }

  Future<List<ChapterModel>> _loadChapters() {
    final cached = _chaptersCache;
    if (cached != null) {
      debugPrint(
        'BookRepositoryImpl._loadChapters: cache hit (${cached.length})',
      );
      return Future.value(cached);
    }

    return _chaptersFuture ??= _readChapters();
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

  Future<List<GlossaryTerm>> _loadGlossary() {
    final cached = _glossaryCache;
    if (cached != null) {
      debugPrint(
        'BookRepositoryImpl._loadGlossary: cache hit (${cached.length})',
      );
      return Future.value(cached);
    }

    return _glossaryFuture ??= _readGlossary();
  }

  Future<List<GlossaryTerm>> _readGlossary() async {
    debugPrint(
      'BookRepositoryImpl._readGlossary: '
          'loading asset $_glossaryAssetPath',
    );

    try {
      final jsonString = await rootBundle.loadString(_glossaryAssetPath);
      final decoded = jsonDecode(jsonString);

      if (decoded is! List) {
        throw const FormatException(
          'glossary.json root must be a list.',
        );
      }

      final terms = decoded
          .whereType<Map>()
          .map(
            (map) => GlossaryTermDto.fromJson(
          map.cast<String, dynamic>(),
        ).toModel(),
      )
          .toList(growable: false);

      _glossaryCache = terms;

      debugPrint(
        'BookRepositoryImpl._readGlossary: '
            'loaded ${terms.length} terms',
      );

      return terms;
    } catch (error, stackTrace) {
      _glossaryFuture = null;

      _appLogger.e(
        'BookRepositoryImpl._readGlossary failed',
        error: error,
        stackTrace: stackTrace,
      );

      rethrow;
    }
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