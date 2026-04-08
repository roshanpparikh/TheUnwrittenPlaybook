// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTipIsarCollection on Isar {
  IsarCollection<TipIsar> get tipIsars => this.collection();
}

const TipIsarSchema = CollectionSchema(
  name: r'TipIsar',
  id: 3587322907776379957,
  properties: {
    r'content': PropertySchema(id: 0, name: r'content', type: IsarType.string),
    r'forChapterId': PropertySchema(
      id: 1,
      name: r'forChapterId',
      type: IsarType.long,
    ),
    r'generatedAtMs': PropertySchema(
      id: 2,
      name: r'generatedAtMs',
      type: IsarType.long,
    ),
    r'label': PropertySchema(id: 3, name: r'label', type: IsarType.string),
    r'type': PropertySchema(id: 4, name: r'type', type: IsarType.string),
  },

  estimateSize: _tipIsarEstimateSize,
  serialize: _tipIsarSerialize,
  deserialize: _tipIsarDeserialize,
  deserializeProp: _tipIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'generatedAtMs': IndexSchema(
      id: 175890871767624139,
      name: r'generatedAtMs',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'generatedAtMs',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'forChapterId': IndexSchema(
      id: -4083386432507910020,
      name: r'forChapterId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'forChapterId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _tipIsarGetId,
  getLinks: _tipIsarGetLinks,
  attach: _tipIsarAttach,
  version: '3.3.0',
);

int _tipIsarEstimateSize(
  TipIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.label.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _tipIsarSerialize(
  TipIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeLong(offsets[1], object.forChapterId);
  writer.writeLong(offsets[2], object.generatedAtMs);
  writer.writeString(offsets[3], object.label);
  writer.writeString(offsets[4], object.type);
}

TipIsar _tipIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TipIsar();
  object.content = reader.readString(offsets[0]);
  object.forChapterId = reader.readLong(offsets[1]);
  object.generatedAtMs = reader.readLong(offsets[2]);
  object.isarId = id;
  object.label = reader.readString(offsets[3]);
  object.type = reader.readString(offsets[4]);
  return object;
}

P _tipIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tipIsarGetId(TipIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _tipIsarGetLinks(TipIsar object) {
  return [];
}

void _tipIsarAttach(IsarCollection<dynamic> col, Id id, TipIsar object) {
  object.isarId = id;
}

extension TipIsarQueryWhereSort on QueryBuilder<TipIsar, TipIsar, QWhere> {
  QueryBuilder<TipIsar, TipIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhere> anyGeneratedAtMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'generatedAtMs'),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhere> anyForChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'forChapterId'),
      );
    });
  }
}

extension TipIsarQueryWhere on QueryBuilder<TipIsar, TipIsar, QWhereClause> {
  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> isarIdNotEqualTo(
    Id isarId,
  ) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> isarIdGreaterThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> generatedAtMsEqualTo(
    int generatedAtMs,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'generatedAtMs',
          value: [generatedAtMs],
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> generatedAtMsNotEqualTo(
    int generatedAtMs,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generatedAtMs',
                lower: [],
                upper: [generatedAtMs],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generatedAtMs',
                lower: [generatedAtMs],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generatedAtMs',
                lower: [generatedAtMs],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generatedAtMs',
                lower: [],
                upper: [generatedAtMs],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> generatedAtMsGreaterThan(
    int generatedAtMs, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'generatedAtMs',
          lower: [generatedAtMs],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> generatedAtMsLessThan(
    int generatedAtMs, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'generatedAtMs',
          lower: [],
          upper: [generatedAtMs],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> generatedAtMsBetween(
    int lowerGeneratedAtMs,
    int upperGeneratedAtMs, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'generatedAtMs',
          lower: [lowerGeneratedAtMs],
          includeLower: includeLower,
          upper: [upperGeneratedAtMs],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> forChapterIdEqualTo(
    int forChapterId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'forChapterId',
          value: [forChapterId],
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> forChapterIdNotEqualTo(
    int forChapterId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'forChapterId',
                lower: [],
                upper: [forChapterId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'forChapterId',
                lower: [forChapterId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'forChapterId',
                lower: [forChapterId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'forChapterId',
                lower: [],
                upper: [forChapterId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> forChapterIdGreaterThan(
    int forChapterId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'forChapterId',
          lower: [forChapterId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> forChapterIdLessThan(
    int forChapterId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'forChapterId',
          lower: [],
          upper: [forChapterId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterWhereClause> forChapterIdBetween(
    int lowerForChapterId,
    int upperForChapterId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'forChapterId',
          lower: [lowerForChapterId],
          includeLower: includeLower,
          upper: [upperForChapterId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension TipIsarQueryFilter
    on QueryBuilder<TipIsar, TipIsar, QFilterCondition> {
  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'content',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'content',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> forChapterIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'forChapterId', value: value),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> forChapterIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'forChapterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> forChapterIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'forChapterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> forChapterIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'forChapterId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> generatedAtMsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'generatedAtMs', value: value),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition>
  generatedAtMsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'generatedAtMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> generatedAtMsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'generatedAtMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> generatedAtMsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'generatedAtMs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> isarIdEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelGreaterThan(
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelLessThan(
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelBetween(
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'label', value: ''),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'label', value: ''),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }
}

extension TipIsarQueryObject
    on QueryBuilder<TipIsar, TipIsar, QFilterCondition> {}

extension TipIsarQueryLinks
    on QueryBuilder<TipIsar, TipIsar, QFilterCondition> {}

extension TipIsarQuerySortBy on QueryBuilder<TipIsar, TipIsar, QSortBy> {
  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByForChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forChapterId', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByForChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forChapterId', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByGeneratedAtMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAtMs', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByGeneratedAtMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAtMs', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TipIsarQuerySortThenBy
    on QueryBuilder<TipIsar, TipIsar, QSortThenBy> {
  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByForChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forChapterId', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByForChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forChapterId', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByGeneratedAtMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAtMs', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByGeneratedAtMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAtMs', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TipIsarQueryWhereDistinct
    on QueryBuilder<TipIsar, TipIsar, QDistinct> {
  QueryBuilder<TipIsar, TipIsar, QDistinct> distinctByContent({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QDistinct> distinctByForChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forChapterId');
    });
  }

  QueryBuilder<TipIsar, TipIsar, QDistinct> distinctByGeneratedAtMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generatedAtMs');
    });
  }

  QueryBuilder<TipIsar, TipIsar, QDistinct> distinctByLabel({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TipIsar, TipIsar, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension TipIsarQueryProperty
    on QueryBuilder<TipIsar, TipIsar, QQueryProperty> {
  QueryBuilder<TipIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<TipIsar, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<TipIsar, int, QQueryOperations> forChapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forChapterId');
    });
  }

  QueryBuilder<TipIsar, int, QQueryOperations> generatedAtMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generatedAtMs');
    });
  }

  QueryBuilder<TipIsar, String, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<TipIsar, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
