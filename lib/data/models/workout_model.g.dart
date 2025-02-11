// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutPlanCollection on Isar {
  IsarCollection<WorkoutPlan> get workoutPlans => this.collection();
}

const WorkoutPlanSchema = CollectionSchema(
  name: r'WorkoutPlan',
  id: 313749700063086650,
  properties: {
    r'athleteId': PropertySchema(
      id: 0,
      name: r'athleteId',
      type: IsarType.long,
    ),
    r'day': PropertySchema(
      id: 1,
      name: r'day',
      type: IsarType.string,
    ),
    r'isRestDay': PropertySchema(
      id: 2,
      name: r'isRestDay',
      type: IsarType.bool,
    ),
    r'workoutCards': PropertySchema(
      id: 3,
      name: r'workoutCards',
      type: IsarType.objectList,
      target: r'WorkoutCard',
    )
  },
  estimateSize: _workoutPlanEstimateSize,
  serialize: _workoutPlanSerialize,
  deserialize: _workoutPlanDeserialize,
  deserializeProp: _workoutPlanDeserializeProp,
  idName: r'id',
  indexes: {
    r'athleteId': IndexSchema(
      id: 5701844619232095782,
      name: r'athleteId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'athleteId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'WorkoutCard': WorkoutCardSchema,
    r'Superset': SupersetSchema,
    r'Try': TrySchema
  },
  getId: _workoutPlanGetId,
  getLinks: _workoutPlanGetLinks,
  attach: _workoutPlanAttach,
  version: '3.1.0+1',
);

int _workoutPlanEstimateSize(
  WorkoutPlan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.day.length * 3;
  bytesCount += 3 + object.workoutCards.length * 3;
  {
    final offsets = allOffsets[WorkoutCard]!;
    for (var i = 0; i < object.workoutCards.length; i++) {
      final value = object.workoutCards[i];
      bytesCount += WorkoutCardSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _workoutPlanSerialize(
  WorkoutPlan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.athleteId);
  writer.writeString(offsets[1], object.day);
  writer.writeBool(offsets[2], object.isRestDay);
  writer.writeObjectList<WorkoutCard>(
    offsets[3],
    allOffsets,
    WorkoutCardSchema.serialize,
    object.workoutCards,
  );
}

WorkoutPlan _workoutPlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutPlan(
    athleteId: reader.readLong(offsets[0]),
    day: reader.readString(offsets[1]),
    isRestDay: reader.readBool(offsets[2]),
    workoutCards: reader.readObjectList<WorkoutCard>(
          offsets[3],
          WorkoutCardSchema.deserialize,
          allOffsets,
          WorkoutCard(),
        ) ??
        [],
  );
  object.id = id;
  return object;
}

P _workoutPlanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readObjectList<WorkoutCard>(
            offset,
            WorkoutCardSchema.deserialize,
            allOffsets,
            WorkoutCard(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutPlanGetId(WorkoutPlan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutPlanGetLinks(WorkoutPlan object) {
  return [];
}

void _workoutPlanAttach(
    IsarCollection<dynamic> col, Id id, WorkoutPlan object) {
  object.id = id;
}

extension WorkoutPlanQueryWhereSort
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QWhere> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhere> anyAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'athleteId'),
      );
    });
  }
}

extension WorkoutPlanQueryWhere
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QWhereClause> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> athleteIdEqualTo(
      int athleteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'athleteId',
        value: [athleteId],
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> athleteIdNotEqualTo(
      int athleteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'athleteId',
              lower: [],
              upper: [athleteId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'athleteId',
              lower: [athleteId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'athleteId',
              lower: [athleteId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'athleteId',
              lower: [],
              upper: [athleteId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause>
      athleteIdGreaterThan(
    int athleteId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'athleteId',
        lower: [athleteId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> athleteIdLessThan(
    int athleteId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'athleteId',
        lower: [],
        upper: [athleteId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> athleteIdBetween(
    int lowerAthleteId,
    int upperAthleteId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'athleteId',
        lower: [lowerAthleteId],
        includeLower: includeLower,
        upper: [upperAthleteId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkoutPlanQueryFilter
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QFilterCondition> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      athleteIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'athleteId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      athleteIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'athleteId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      athleteIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'athleteId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      athleteIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'athleteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'day',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> dayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      dayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      isRestDayEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRestDay',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      workoutCardsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutCards',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      workoutCardsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutCards',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      workoutCardsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutCards',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      workoutCardsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutCards',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      workoutCardsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutCards',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      workoutCardsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'workoutCards',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension WorkoutPlanQueryObject
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QFilterCondition> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      workoutCardsElement(FilterQuery<WorkoutCard> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'workoutCards');
    });
  }
}

extension WorkoutPlanQueryLinks
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QFilterCondition> {}

extension WorkoutPlanQuerySortBy
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QSortBy> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByAthleteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByIsRestDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByIsRestDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.desc);
    });
  }
}

extension WorkoutPlanQuerySortThenBy
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QSortThenBy> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByAthleteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByIsRestDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByIsRestDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.desc);
    });
  }
}

extension WorkoutPlanQueryWhereDistinct
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'athleteId');
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByDay(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByIsRestDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRestDay');
    });
  }
}

extension WorkoutPlanQueryProperty
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QQueryProperty> {
  QueryBuilder<WorkoutPlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutPlan, int, QQueryOperations> athleteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'athleteId');
    });
  }

  QueryBuilder<WorkoutPlan, String, QQueryOperations> dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day');
    });
  }

  QueryBuilder<WorkoutPlan, bool, QQueryOperations> isRestDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRestDay');
    });
  }

  QueryBuilder<WorkoutPlan, List<WorkoutCard>, QQueryOperations>
      workoutCardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workoutCards');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WorkoutCardSchema = Schema(
  name: r'WorkoutCard',
  id: 5297060475056040231,
  properties: {
    r'exerciseName': PropertySchema(
      id: 0,
      name: r'exerciseName',
      type: IsarType.string,
    ),
    r'reps': PropertySchema(
      id: 1,
      name: r'reps',
      type: IsarType.long,
    ),
    r'sets': PropertySchema(
      id: 2,
      name: r'sets',
      type: IsarType.long,
    ),
    r'supersets': PropertySchema(
      id: 3,
      name: r'supersets',
      type: IsarType.objectList,
      target: r'Superset',
    ),
    r'technique': PropertySchema(
      id: 4,
      name: r'technique',
      type: IsarType.string,
    )
  },
  estimateSize: _workoutCardEstimateSize,
  serialize: _workoutCardSerialize,
  deserialize: _workoutCardDeserialize,
  deserializeProp: _workoutCardDeserializeProp,
);

int _workoutCardEstimateSize(
  WorkoutCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.exerciseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.supersets;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Superset]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += SupersetSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.technique;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _workoutCardSerialize(
  WorkoutCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.exerciseName);
  writer.writeLong(offsets[1], object.reps);
  writer.writeLong(offsets[2], object.sets);
  writer.writeObjectList<Superset>(
    offsets[3],
    allOffsets,
    SupersetSchema.serialize,
    object.supersets,
  );
  writer.writeString(offsets[4], object.technique);
}

WorkoutCard _workoutCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutCard(
    exerciseName: reader.readStringOrNull(offsets[0]),
    reps: reader.readLongOrNull(offsets[1]),
    sets: reader.readLongOrNull(offsets[2]),
    supersets: reader.readObjectList<Superset>(
      offsets[3],
      SupersetSchema.deserialize,
      allOffsets,
      Superset(),
    ),
    technique: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _workoutCardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<Superset>(
        offset,
        SupersetSchema.deserialize,
        allOffsets,
        Superset(),
      )) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WorkoutCardQueryFilter
    on QueryBuilder<WorkoutCard, WorkoutCard, QFilterCondition> {
  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      repsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      setsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supersets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supersets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supersets',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supersets',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supersets',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supersets',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supersets',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supersets',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technique',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technique',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technique',
        value: '',
      ));
    });
  }
}

extension WorkoutCardQueryObject
    on QueryBuilder<WorkoutCard, WorkoutCard, QFilterCondition> {
  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetsElement(FilterQuery<Superset> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'supersets');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SupersetSchema = Schema(
  name: r'Superset',
  id: -3080378786879218126,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'reps': PropertySchema(
      id: 1,
      name: r'reps',
      type: IsarType.long,
    ),
    r'sets': PropertySchema(
      id: 2,
      name: r'sets',
      type: IsarType.long,
    ),
    r'technique': PropertySchema(
      id: 3,
      name: r'technique',
      type: IsarType.string,
    ),
    r'tries': PropertySchema(
      id: 4,
      name: r'tries',
      type: IsarType.objectList,
      target: r'Try',
    )
  },
  estimateSize: _supersetEstimateSize,
  serialize: _supersetSerialize,
  deserialize: _supersetDeserialize,
  deserializeProp: _supersetDeserializeProp,
);

int _supersetEstimateSize(
  Superset object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.technique;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Try]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += TrySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _supersetSerialize(
  Superset object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeLong(offsets[1], object.reps);
  writer.writeLong(offsets[2], object.sets);
  writer.writeString(offsets[3], object.technique);
  writer.writeObjectList<Try>(
    offsets[4],
    allOffsets,
    TrySchema.serialize,
    object.tries,
  );
}

Superset _supersetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Superset(
    name: reader.readStringOrNull(offsets[0]),
    reps: reader.readLongOrNull(offsets[1]),
    sets: reader.readLongOrNull(offsets[2]),
    technique: reader.readStringOrNull(offsets[3]),
    tries: reader.readObjectList<Try>(
      offsets[4],
      TrySchema.deserialize,
      allOffsets,
      Try(),
    ),
  );
  return object;
}

P _supersetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<Try>(
        offset,
        TrySchema.deserialize,
        allOffsets,
        Try(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SupersetQueryFilter
    on QueryBuilder<Superset, Superset, QFilterCondition> {
  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> repsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> repsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> repsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> repsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> repsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> repsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> setsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> setsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> setsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> setsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> setsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> setsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technique',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technique',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> techniqueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition>
      techniqueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tries',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tries',
      ));
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition>
      triesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SupersetQueryObject
    on QueryBuilder<Superset, Superset, QFilterCondition> {
  QueryBuilder<Superset, Superset, QAfterFilterCondition> triesElement(
      FilterQuery<Try> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tries');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TrySchema = Schema(
  name: r'Try',
  id: 1828986315718452792,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'reps': PropertySchema(
      id: 1,
      name: r'reps',
      type: IsarType.long,
    ),
    r'sets': PropertySchema(
      id: 2,
      name: r'sets',
      type: IsarType.long,
    ),
    r'technique': PropertySchema(
      id: 3,
      name: r'technique',
      type: IsarType.string,
    )
  },
  estimateSize: _tryEstimateSize,
  serialize: _trySerialize,
  deserialize: _tryDeserialize,
  deserializeProp: _tryDeserializeProp,
);

int _tryEstimateSize(
  Try object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.technique;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trySerialize(
  Try object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeLong(offsets[1], object.reps);
  writer.writeLong(offsets[2], object.sets);
  writer.writeString(offsets[3], object.technique);
}

Try _tryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Try(
    name: reader.readStringOrNull(offsets[0]),
    reps: reader.readLongOrNull(offsets[1]),
    sets: reader.readLongOrNull(offsets[2]),
    technique: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _tryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TryQueryFilter on QueryBuilder<Try, Try, QFilterCondition> {
  QueryBuilder<Try, Try, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> repsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> repsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reps',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> repsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> repsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> repsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> repsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> setsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> setsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sets',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> setsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> setsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> setsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> setsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technique',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technique',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<Try, Try, QAfterFilterCondition> techniqueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technique',
        value: '',
      ));
    });
  }
}

extension TryQueryObject on QueryBuilder<Try, Try, QFilterCondition> {}
