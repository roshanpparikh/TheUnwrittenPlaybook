// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_speech_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChapterSpeechIsarCollection on Isar {
  IsarCollection<ChapterSpeechIsar> get chapterSpeechIsars => this.collection();
}

const ChapterSpeechIsarSchema = CollectionSchema(
  name: r'ChapterSpeechIsar',
  id: -8000850188544042888,
  properties: {
    r'bookId': PropertySchema(id: 0, name: r'bookId', type: IsarType.string),
    r'chapterId': PropertySchema(
      id: 1,
      name: r'chapterId',
      type: IsarType.string,
    ),
    r'uniqueKey': PropertySchema(
      id: 2,
      name: r'uniqueKey',
      type: IsarType.string,
    ),
    r'voiceId': PropertySchema(id: 3, name: r'voiceId', type: IsarType.string),
  },

  estimateSize: _chapterSpeechIsarEstimateSize,
  serialize: _chapterSpeechIsarSerialize,
  deserialize: _chapterSpeechIsarDeserialize,
  deserializeProp: _chapterSpeechIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'bookId': IndexSchema(
      id: 3567540928881766442,
      name: r'bookId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'chapterId': IndexSchema(
      id: -1917949875430644359,
      name: r'chapterId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'chapterId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'voiceId': IndexSchema(
      id: -1082098462693260084,
      name: r'voiceId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'voiceId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'uniqueKey': IndexSchema(
      id: -866995956150369819,
      name: r'uniqueKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uniqueKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _chapterSpeechIsarGetId,
  getLinks: _chapterSpeechIsarGetLinks,
  attach: _chapterSpeechIsarAttach,
  version: '3.3.0',
);

int _chapterSpeechIsarEstimateSize(
  ChapterSpeechIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookId.length * 3;
  bytesCount += 3 + object.chapterId.length * 3;
  bytesCount += 3 + object.uniqueKey.length * 3;
  bytesCount += 3 + object.voiceId.length * 3;
  return bytesCount;
}

void _chapterSpeechIsarSerialize(
  ChapterSpeechIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookId);
  writer.writeString(offsets[1], object.chapterId);
  writer.writeString(offsets[2], object.uniqueKey);
  writer.writeString(offsets[3], object.voiceId);
}

ChapterSpeechIsar _chapterSpeechIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterSpeechIsar();
  object.bookId = reader.readString(offsets[0]);
  object.chapterId = reader.readString(offsets[1]);
  object.isarId = id;
  object.uniqueKey = reader.readString(offsets[2]);
  object.voiceId = reader.readString(offsets[3]);
  return object;
}

P _chapterSpeechIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chapterSpeechIsarGetId(ChapterSpeechIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _chapterSpeechIsarGetLinks(
  ChapterSpeechIsar object,
) {
  return [];
}

void _chapterSpeechIsarAttach(
  IsarCollection<dynamic> col,
  Id id,
  ChapterSpeechIsar object,
) {
  object.isarId = id;
}

extension ChapterSpeechIsarByIndex on IsarCollection<ChapterSpeechIsar> {
  Future<ChapterSpeechIsar?> getByUniqueKey(String uniqueKey) {
    return getByIndex(r'uniqueKey', [uniqueKey]);
  }

  ChapterSpeechIsar? getByUniqueKeySync(String uniqueKey) {
    return getByIndexSync(r'uniqueKey', [uniqueKey]);
  }

  Future<bool> deleteByUniqueKey(String uniqueKey) {
    return deleteByIndex(r'uniqueKey', [uniqueKey]);
  }

  bool deleteByUniqueKeySync(String uniqueKey) {
    return deleteByIndexSync(r'uniqueKey', [uniqueKey]);
  }

  Future<List<ChapterSpeechIsar?>> getAllByUniqueKey(
    List<String> uniqueKeyValues,
  ) {
    final values = uniqueKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'uniqueKey', values);
  }

  List<ChapterSpeechIsar?> getAllByUniqueKeySync(List<String> uniqueKeyValues) {
    final values = uniqueKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uniqueKey', values);
  }

  Future<int> deleteAllByUniqueKey(List<String> uniqueKeyValues) {
    final values = uniqueKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uniqueKey', values);
  }

  int deleteAllByUniqueKeySync(List<String> uniqueKeyValues) {
    final values = uniqueKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uniqueKey', values);
  }

  Future<Id> putByUniqueKey(ChapterSpeechIsar object) {
    return putByIndex(r'uniqueKey', object);
  }

  Id putByUniqueKeySync(ChapterSpeechIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'uniqueKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUniqueKey(List<ChapterSpeechIsar> objects) {
    return putAllByIndex(r'uniqueKey', objects);
  }

  List<Id> putAllByUniqueKeySync(
    List<ChapterSpeechIsar> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'uniqueKey', objects, saveLinks: saveLinks);
  }
}

extension ChapterSpeechIsarQueryWhereSort
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QWhere> {
  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChapterSpeechIsarQueryWhere
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QWhereClause> {
  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerIsarId,
          includeLower: includeLower,
          upper: upperIsarId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  bookIdEqualTo(String bookId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: [bookId]),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  bookIdNotEqualTo(String bookId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [],
                upper: [bookId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [bookId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [bookId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [],
                upper: [bookId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  chapterIdEqualTo(String chapterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'chapterId', value: [chapterId]),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  chapterIdNotEqualTo(String chapterId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [],
                upper: [chapterId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [chapterId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [chapterId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [],
                upper: [chapterId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  voiceIdEqualTo(String voiceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'voiceId', value: [voiceId]),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  voiceIdNotEqualTo(String voiceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'voiceId',
                lower: [],
                upper: [voiceId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'voiceId',
                lower: [voiceId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'voiceId',
                lower: [voiceId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'voiceId',
                lower: [],
                upper: [voiceId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  uniqueKeyEqualTo(String uniqueKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'uniqueKey', value: [uniqueKey]),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterWhereClause>
  uniqueKeyNotEqualTo(String uniqueKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uniqueKey',
                lower: [],
                upper: [uniqueKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uniqueKey',
                lower: [uniqueKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uniqueKey',
                lower: [uniqueKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uniqueKey',
                lower: [],
                upper: [uniqueKey],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ChapterSpeechIsarQueryFilter
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QFilterCondition> {
  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bookId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chapterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chapterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chapterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chapterId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chapterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chapterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chapterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chapterId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapterId', value: ''),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  chapterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chapterId', value: ''),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  isarIdGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  isarIdLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isarId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uniqueKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uniqueKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uniqueKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uniqueKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'uniqueKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'uniqueKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'uniqueKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'uniqueKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uniqueKey', value: ''),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  uniqueKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uniqueKey', value: ''),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'voiceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'voiceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'voiceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'voiceId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'voiceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'voiceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'voiceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'voiceId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'voiceId', value: ''),
      );
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterFilterCondition>
  voiceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'voiceId', value: ''),
      );
    });
  }
}

extension ChapterSpeechIsarQueryObject
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QFilterCondition> {}

extension ChapterSpeechIsarQueryLinks
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QFilterCondition> {}

extension ChapterSpeechIsarQuerySortBy
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QSortBy> {
  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByUniqueKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByUniqueKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByVoiceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  sortByVoiceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceId', Sort.desc);
    });
  }
}

extension ChapterSpeechIsarQuerySortThenBy
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QSortThenBy> {
  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByUniqueKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByUniqueKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByVoiceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QAfterSortBy>
  thenByVoiceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voiceId', Sort.desc);
    });
  }
}

extension ChapterSpeechIsarQueryWhereDistinct
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QDistinct> {
  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QDistinct>
  distinctByBookId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QDistinct>
  distinctByChapterId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QDistinct>
  distinctByUniqueKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uniqueKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QDistinct>
  distinctByVoiceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voiceId', caseSensitive: caseSensitive);
    });
  }
}

extension ChapterSpeechIsarQueryProperty
    on QueryBuilder<ChapterSpeechIsar, ChapterSpeechIsar, QQueryProperty> {
  QueryBuilder<ChapterSpeechIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ChapterSpeechIsar, String, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<ChapterSpeechIsar, String, QQueryOperations>
  chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterId');
    });
  }

  QueryBuilder<ChapterSpeechIsar, String, QQueryOperations>
  uniqueKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uniqueKey');
    });
  }

  QueryBuilder<ChapterSpeechIsar, String, QQueryOperations> voiceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voiceId');
    });
  }
}
