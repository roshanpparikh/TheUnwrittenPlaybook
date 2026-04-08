// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedded_chunk_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEmbeddedChunkIsarCollection on Isar {
  IsarCollection<EmbeddedChunkIsar> get embeddedChunkIsars => this.collection();
}

const EmbeddedChunkIsarSchema = CollectionSchema(
  name: r'EmbeddedChunkIsar',
  id: -8631742514099757367,
  properties: {
    r'chapterId': PropertySchema(
      id: 0,
      name: r'chapterId',
      type: IsarType.string,
    ),
    r'chapterTitle': PropertySchema(
      id: 1,
      name: r'chapterTitle',
      type: IsarType.string,
    ),
    r'chunkId': PropertySchema(id: 2, name: r'chunkId', type: IsarType.string),
    r'embedding': PropertySchema(
      id: 3,
      name: r'embedding',
      type: IsarType.doubleList,
    ),
    r'embeddingDimensions': PropertySchema(
      id: 4,
      name: r'embeddingDimensions',
      type: IsarType.long,
    ),
    r'embeddingModel': PropertySchema(
      id: 5,
      name: r'embeddingModel',
      type: IsarType.string,
    ),
    r'importedAt': PropertySchema(
      id: 6,
      name: r'importedAt',
      type: IsarType.dateTime,
    ),
    r'kind': PropertySchema(id: 7, name: r'kind', type: IsarType.string),
    r'order': PropertySchema(id: 8, name: r'order', type: IsarType.long),
    r'sectionTitle': PropertySchema(
      id: 9,
      name: r'sectionTitle',
      type: IsarType.string,
    ),
    r'text': PropertySchema(id: 10, name: r'text', type: IsarType.string),
  },

  estimateSize: _embeddedChunkIsarEstimateSize,
  serialize: _embeddedChunkIsarSerialize,
  deserialize: _embeddedChunkIsarDeserialize,
  deserializeProp: _embeddedChunkIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'chunkId': IndexSchema(
      id: 7020861766424886656,
      name: r'chunkId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'chunkId',
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
    r'kind': IndexSchema(
      id: 1484550194077596484,
      name: r'kind',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'kind',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _embeddedChunkIsarGetId,
  getLinks: _embeddedChunkIsarGetLinks,
  attach: _embeddedChunkIsarAttach,
  version: '3.3.0',
);

int _embeddedChunkIsarEstimateSize(
  EmbeddedChunkIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chapterId.length * 3;
  {
    final value = object.chapterTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.chunkId.length * 3;
  bytesCount += 3 + object.embedding.length * 8;
  {
    final value = object.embeddingModel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.kind.length * 3;
  {
    final value = object.sectionTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _embeddedChunkIsarSerialize(
  EmbeddedChunkIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chapterId);
  writer.writeString(offsets[1], object.chapterTitle);
  writer.writeString(offsets[2], object.chunkId);
  writer.writeDoubleList(offsets[3], object.embedding);
  writer.writeLong(offsets[4], object.embeddingDimensions);
  writer.writeString(offsets[5], object.embeddingModel);
  writer.writeDateTime(offsets[6], object.importedAt);
  writer.writeString(offsets[7], object.kind);
  writer.writeLong(offsets[8], object.order);
  writer.writeString(offsets[9], object.sectionTitle);
  writer.writeString(offsets[10], object.text);
}

EmbeddedChunkIsar _embeddedChunkIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmbeddedChunkIsar();
  object.chapterId = reader.readString(offsets[0]);
  object.chapterTitle = reader.readStringOrNull(offsets[1]);
  object.chunkId = reader.readString(offsets[2]);
  object.embedding = reader.readDoubleList(offsets[3]) ?? [];
  object.embeddingDimensions = reader.readLongOrNull(offsets[4]);
  object.embeddingModel = reader.readStringOrNull(offsets[5]);
  object.importedAt = reader.readDateTimeOrNull(offsets[6]);
  object.isarId = id;
  object.kind = reader.readString(offsets[7]);
  object.order = reader.readLongOrNull(offsets[8]);
  object.sectionTitle = reader.readStringOrNull(offsets[9]);
  object.text = reader.readString(offsets[10]);
  return object;
}

P _embeddedChunkIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _embeddedChunkIsarGetId(EmbeddedChunkIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _embeddedChunkIsarGetLinks(
  EmbeddedChunkIsar object,
) {
  return [];
}

void _embeddedChunkIsarAttach(
  IsarCollection<dynamic> col,
  Id id,
  EmbeddedChunkIsar object,
) {
  object.isarId = id;
}

extension EmbeddedChunkIsarByIndex on IsarCollection<EmbeddedChunkIsar> {
  Future<EmbeddedChunkIsar?> getByChunkId(String chunkId) {
    return getByIndex(r'chunkId', [chunkId]);
  }

  EmbeddedChunkIsar? getByChunkIdSync(String chunkId) {
    return getByIndexSync(r'chunkId', [chunkId]);
  }

  Future<bool> deleteByChunkId(String chunkId) {
    return deleteByIndex(r'chunkId', [chunkId]);
  }

  bool deleteByChunkIdSync(String chunkId) {
    return deleteByIndexSync(r'chunkId', [chunkId]);
  }

  Future<List<EmbeddedChunkIsar?>> getAllByChunkId(List<String> chunkIdValues) {
    final values = chunkIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'chunkId', values);
  }

  List<EmbeddedChunkIsar?> getAllByChunkIdSync(List<String> chunkIdValues) {
    final values = chunkIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'chunkId', values);
  }

  Future<int> deleteAllByChunkId(List<String> chunkIdValues) {
    final values = chunkIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'chunkId', values);
  }

  int deleteAllByChunkIdSync(List<String> chunkIdValues) {
    final values = chunkIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'chunkId', values);
  }

  Future<Id> putByChunkId(EmbeddedChunkIsar object) {
    return putByIndex(r'chunkId', object);
  }

  Id putByChunkIdSync(EmbeddedChunkIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'chunkId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByChunkId(List<EmbeddedChunkIsar> objects) {
    return putAllByIndex(r'chunkId', objects);
  }

  List<Id> putAllByChunkIdSync(
    List<EmbeddedChunkIsar> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'chunkId', objects, saveLinks: saveLinks);
  }
}

extension EmbeddedChunkIsarQueryWhereSort
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QWhere> {
  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EmbeddedChunkIsarQueryWhere
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QWhereClause> {
  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  chunkIdEqualTo(String chunkId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'chunkId', value: [chunkId]),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  chunkIdNotEqualTo(String chunkId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chunkId',
                lower: [],
                upper: [chunkId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chunkId',
                lower: [chunkId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chunkId',
                lower: [chunkId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chunkId',
                lower: [],
                upper: [chunkId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  chapterIdEqualTo(String chapterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'chapterId', value: [chapterId]),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  kindEqualTo(String kind) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'kind', value: [kind]),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterWhereClause>
  kindNotEqualTo(String kind) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'kind',
                lower: [],
                upper: [kind],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'kind',
                lower: [kind],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'kind',
                lower: [kind],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'kind',
                lower: [],
                upper: [kind],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension EmbeddedChunkIsarQueryFilter
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QFilterCondition> {
  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapterId', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chapterId', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'chapterTitle'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'chapterTitle'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chapterTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chapterTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chapterTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chapterTitle',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chapterTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chapterTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chapterTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chapterTitle',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapterTitle', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chapterTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chapterTitle', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chunkIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chunkId', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  chunkIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chunkId', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingElementEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'embedding',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'embedding',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'embedding',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'embedding',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'embedding', length, true, length, true);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'embedding', 0, true, 0, true);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'embedding', 0, false, 999999, true);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'embedding', 0, true, length, include);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'embedding', length, include, 999999, true);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'embedding',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingDimensionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'embeddingDimensions'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingDimensionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'embeddingDimensions'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingDimensionsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'embeddingDimensions', value: value),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingDimensionsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'embeddingDimensions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingDimensionsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'embeddingDimensions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingDimensionsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'embeddingDimensions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'embeddingModel'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'embeddingModel'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'embeddingModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'embeddingModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'embeddingModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'embeddingModel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'embeddingModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'embeddingModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'embeddingModel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'embeddingModel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'embeddingModel', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  embeddingModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'embeddingModel', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  importedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'importedAt'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  importedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'importedAt'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  importedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'importedAt', value: value),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  importedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'importedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  importedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'importedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  importedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'importedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'kind',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'kind',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'kind', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  kindIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'kind', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'order'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'order'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  orderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'order', value: value),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  orderGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  orderLessThan(int? value, {bool include = false}) {
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  orderBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sectionTitle'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sectionTitle'),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sectionTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sectionTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sectionTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sectionTitle',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sectionTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sectionTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sectionTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sectionTitle',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sectionTitle', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  sectionTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sectionTitle', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
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

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterFilterCondition>
  textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'text', value: ''),
      );
    });
  }
}

extension EmbeddedChunkIsarQueryObject
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QFilterCondition> {}

extension EmbeddedChunkIsarQueryLinks
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QFilterCondition> {}

extension EmbeddedChunkIsarQuerySortBy
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QSortBy> {
  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByChapterTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterTitle', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByChapterTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterTitle', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByChunkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByChunkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByEmbeddingDimensions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingDimensions', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByEmbeddingDimensionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingDimensions', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByEmbeddingModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingModel', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByEmbeddingModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingModel', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByImportedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importedAt', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByImportedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importedAt', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortBySectionTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionTitle', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortBySectionTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionTitle', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension EmbeddedChunkIsarQuerySortThenBy
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QSortThenBy> {
  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByChapterTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterTitle', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByChapterTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterTitle', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByChunkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByChunkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chunkId', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByEmbeddingDimensions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingDimensions', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByEmbeddingDimensionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingDimensions', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByEmbeddingModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingModel', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByEmbeddingModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'embeddingModel', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByImportedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importedAt', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByImportedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importedAt', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kind', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenBySectionTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionTitle', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenBySectionTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionTitle', Sort.desc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QAfterSortBy>
  thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension EmbeddedChunkIsarQueryWhereDistinct
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct> {
  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByChapterId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByChapterTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByChunkId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chunkId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByEmbedding() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'embedding');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByEmbeddingDimensions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'embeddingDimensions');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByEmbeddingModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'embeddingModel',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByImportedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importedAt');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct> distinctByKind({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kind', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct>
  distinctBySectionTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sectionTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QDistinct> distinctByText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension EmbeddedChunkIsarQueryProperty
    on QueryBuilder<EmbeddedChunkIsar, EmbeddedChunkIsar, QQueryProperty> {
  QueryBuilder<EmbeddedChunkIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, String, QQueryOperations>
  chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterId');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, String?, QQueryOperations>
  chapterTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterTitle');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, String, QQueryOperations> chunkIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chunkId');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, List<double>, QQueryOperations>
  embeddingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'embedding');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, int?, QQueryOperations>
  embeddingDimensionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'embeddingDimensions');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, String?, QQueryOperations>
  embeddingModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'embeddingModel');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, DateTime?, QQueryOperations>
  importedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importedAt');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, String, QQueryOperations> kindProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kind');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, String?, QQueryOperations>
  sectionTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sectionTitle');
    });
  }

  QueryBuilder<EmbeddedChunkIsar, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}
