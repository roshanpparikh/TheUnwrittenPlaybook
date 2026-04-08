// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_speech_chunk_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChapterSpeechChunkIsarCollection on Isar {
  IsarCollection<ChapterSpeechChunkIsar> get chapterSpeechChunkIsars =>
      this.collection();
}

const ChapterSpeechChunkIsarSchema = CollectionSchema(
  name: r'ChapterSpeechChunkIsar',
  id: -4418362800516767637,
  properties: {
    r'bookId': PropertySchema(id: 0, name: r'bookId', type: IsarType.string),
    r'chapterId': PropertySchema(
      id: 1,
      name: r'chapterId',
      type: IsarType.string,
    ),
    r'chunkId': PropertySchema(id: 2, name: r'chunkId', type: IsarType.string),
    r'isReady': PropertySchema(id: 3, name: r'isReady', type: IsarType.bool),
    r'label': PropertySchema(id: 4, name: r'label', type: IsarType.string),
    r'localPath': PropertySchema(
      id: 5,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'order': PropertySchema(id: 6, name: r'order', type: IsarType.long),
    r'speechId': PropertySchema(
      id: 7,
      name: r'speechId',
      type: IsarType.string,
    ),
    r'text': PropertySchema(id: 8, name: r'text', type: IsarType.string),
    r'uniqueKey': PropertySchema(
      id: 9,
      name: r'uniqueKey',
      type: IsarType.string,
    ),
  },

  estimateSize: _chapterSpeechChunkIsarEstimateSize,
  serialize: _chapterSpeechChunkIsarSerialize,
  deserialize: _chapterSpeechChunkIsarDeserialize,
  deserializeProp: _chapterSpeechChunkIsarDeserializeProp,
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
    r'speechId': IndexSchema(
      id: 8511040890138688459,
      name: r'speechId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'speechId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'order': IndexSchema(
      id: 5897270977454184057,
      name: r'order',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'order',
          type: IndexType.value,
          caseSensitive: false,
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

  getId: _chapterSpeechChunkIsarGetId,
  getLinks: _chapterSpeechChunkIsarGetLinks,
  attach: _chapterSpeechChunkIsarAttach,
  version: '3.3.0',
);

int _chapterSpeechChunkIsarEstimateSize(
  ChapterSpeechChunkIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookId.length * 3;
  bytesCount += 3 + object.chapterId.length * 3;
  bytesCount += 3 + object.chunkId.length * 3;
  bytesCount += 3 + object.label.length * 3;
  bytesCount += 3 + object.localPath.length * 3;
  bytesCount += 3 + object.speechId.length * 3;
  bytesCount += 3 + object.text.length * 3;
  bytesCount += 3 + object.uniqueKey.length * 3;
  return bytesCount;
}

void _chapterSpeechChunkIsarSerialize(
  ChapterSpeechChunkIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookId);
  writer.writeString(offsets[1], object.chapterId);
  writer.writeString(offsets[2], object.chunkId);
  writer.writeBool(offsets[3], object.isReady);
  writer.writeString(offsets[4], object.label);
  writer.writeString(offsets[5], object.localPath);
  writer.writeLong(offsets[6], object.order);
  writer.writeString(offsets[7], object.speechId);
  writer.writeString(offsets[8], object.text);
  writer.writeString(offsets[9], object.uniqueKey);
}

ChapterSpeechChunkIsar _chapterSpeechChunkIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterSpeechChunkIsar();
  object.bookId = reader.readString(offsets[0]);
  object.chapterId = reader.readString(offsets[1]);
  object.chunkId = reader.readString(offsets[2]);
  object.isReady = reader.readBool(offsets[3]);
  object.isarId = id;
  object.label = reader.readString(offsets[4]);
  object.localPath = reader.readString(offsets[5]);
  object.order = reader.readLong(offsets[6]);
  object.speechId = reader.readString(offsets[7]);
  object.text = reader.readString(offsets[8]);
  object.uniqueKey = reader.readString(offsets[9]);
  return object;
}

P _chapterSpeechChunkIsarDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chapterSpeechChunkIsarGetId(ChapterSpeechChunkIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _chapterSpeechChunkIsarGetLinks(
  ChapterSpeechChunkIsar object,
) {
  return [];
}

void _chapterSpeechChunkIsarAttach(
  IsarCollection<dynamic> col,
  Id id,
  ChapterSpeechChunkIsar object,
) {
  object.isarId = id;
}

extension ChapterSpeechChunkIsarByIndex
    on IsarCollection<ChapterSpeechChunkIsar> {
  Future<ChapterSpeechChunkIsar?> getByUniqueKey(String uniqueKey) {
    return getByIndex(r'uniqueKey', [uniqueKey]);
  }

  ChapterSpeechChunkIsar? getByUniqueKeySync(String uniqueKey) {
    return getByIndexSync(r'uniqueKey', [uniqueKey]);
  }

  Future<bool> deleteByUniqueKey(String uniqueKey) {
    return deleteByIndex(r'uniqueKey', [uniqueKey]);
  }

  bool deleteByUniqueKeySync(String uniqueKey) {
    return deleteByIndexSync(r'uniqueKey', [uniqueKey]);
  }

  Future<List<ChapterSpeechChunkIsar?>> getAllByUniqueKey(
    List<String> uniqueKeyValues,
  ) {
    final values = uniqueKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'uniqueKey', values);
  }

  List<ChapterSpeechChunkIsar?> getAllByUniqueKeySync(
    List<String> uniqueKeyValues,
  ) {
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

  Future<Id> putByUniqueKey(ChapterSpeechChunkIsar object) {
    return putByIndex(r'uniqueKey', object);
  }

  Id putByUniqueKeySync(
    ChapterSpeechChunkIsar object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'uniqueKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUniqueKey(List<ChapterSpeechChunkIsar> objects) {
    return putAllByIndex(r'uniqueKey', objects);
  }

  List<Id> putAllByUniqueKeySync(
    List<ChapterSpeechChunkIsar> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'uniqueKey', objects, saveLinks: saveLinks);
  }
}

extension ChapterSpeechChunkIsarQueryWhereSort
    on QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QWhere> {
  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterWhere>
  anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterWhere>
  anyOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'order'),
      );
    });
  }
}

extension ChapterSpeechChunkIsarQueryWhere
    on
        QueryBuilder<
          ChapterSpeechChunkIsar,
          ChapterSpeechChunkIsar,
          QWhereClause
        > {
  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  bookIdEqualTo(String bookId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: [bookId]),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  chapterIdEqualTo(String chapterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'chapterId', value: [chapterId]),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  speechIdEqualTo(String speechId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'speechId', value: [speechId]),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  speechIdNotEqualTo(String speechId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'speechId',
                lower: [],
                upper: [speechId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'speechId',
                lower: [speechId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'speechId',
                lower: [speechId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'speechId',
                lower: [],
                upper: [speechId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  orderEqualTo(int order) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'order', value: [order]),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  orderNotEqualTo(int order) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [],
                upper: [order],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [order],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [order],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [],
                upper: [order],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  orderGreaterThan(int order, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'order',
          lower: [order],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  orderLessThan(int order, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'order',
          lower: [],
          upper: [order],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  orderBetween(
    int lowerOrder,
    int upperOrder, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'order',
          lower: [lowerOrder],
          includeLower: includeLower,
          upper: [upperOrder],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
  uniqueKeyEqualTo(String uniqueKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'uniqueKey', value: [uniqueKey]),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterWhereClause
  >
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

extension ChapterSpeechChunkIsarQueryFilter
    on
        QueryBuilder<
          ChapterSpeechChunkIsar,
          ChapterSpeechChunkIsar,
          QFilterCondition
        > {
  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chapterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapterId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chapterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chapterId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chunkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chunkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chunkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chunkId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chunkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chunkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chunkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chunkId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chunkId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  chunkIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chunkId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  isReadyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isReady', value: value),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'label',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'label',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'label',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'label',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'label',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'label',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'label',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'label',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'label', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'label', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'localPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localPath', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  localPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localPath', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'order', value: value),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  orderGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'order',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  orderLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'order',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'order',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'speechId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speechId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speechId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speechId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'speechId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'speechId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'speechId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'speechId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'speechId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  speechIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'speechId', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'text',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'text',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  uniqueKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uniqueKey', value: ''),
      );
    });
  }

  QueryBuilder<
    ChapterSpeechChunkIsar,
    ChapterSpeechChunkIsar,
    QAfterFilterCondition
  >
  uniqueKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uniqueKey', value: ''),
      );
    });
  }
}

extension ChapterSpeechChunkIsarQueryObject
    on
        QueryBuilder<
          ChapterSpeechChunkIsar,
          ChapterSpeechChunkIsar,
          QFilterCondition
        > {}

extension ChapterSpeechChunkIsarQueryLinks
    on
        QueryBuilder<
          ChapterSpeechChunkIsar,
          ChapterSpeechChunkIsar,
          QFilterCondition
        > {}

extension ChapterSpeechChunkIsarQuerySortBy
    on QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QSortBy> {
  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByChunkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByChunkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByIsReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReady', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByIsReadyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReady', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortBySpeechId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortBySpeechIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByUniqueKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  sortByUniqueKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.desc);
    });
  }
}

extension ChapterSpeechChunkIsarQuerySortThenBy
    on
        QueryBuilder<
          ChapterSpeechChunkIsar,
          ChapterSpeechChunkIsar,
          QSortThenBy
        > {
  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByChunkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByChunkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByIsReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReady', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByIsReadyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReady', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenBySpeechId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechId', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenBySpeechIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speechId', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByUniqueKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.asc);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QAfterSortBy>
  thenByUniqueKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.desc);
    });
  }
}

extension ChapterSpeechChunkIsarQueryWhereDistinct
    on QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct> {
  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByBookId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByChapterId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByChunkId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chunkId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByIsReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReady');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByLocalPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctBySpeechId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speechId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, ChapterSpeechChunkIsar, QDistinct>
  distinctByUniqueKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uniqueKey', caseSensitive: caseSensitive);
    });
  }
}

extension ChapterSpeechChunkIsarQueryProperty
    on
        QueryBuilder<
          ChapterSpeechChunkIsar,
          ChapterSpeechChunkIsar,
          QQueryProperty
        > {
  QueryBuilder<ChapterSpeechChunkIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterId');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  chunkIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chunkId');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, bool, QQueryOperations>
  isReadyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReady');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  localPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localPath');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  speechIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speechId');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<ChapterSpeechChunkIsar, String, QQueryOperations>
  uniqueKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uniqueKey');
    });
  }
}
