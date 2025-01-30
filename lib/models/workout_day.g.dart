// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_day.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutDayCollection on Isar {
  IsarCollection<WorkoutDay> get workoutDays => this.collection();
}

const WorkoutDaySchema = CollectionSchema(
  name: r'WorkoutDay',
  id: -473137167238769109,
  properties: {
    r'categoriesSerialized': PropertySchema(
      id: 0,
      name: r'categoriesSerialized',
      type: IsarType.string,
    ),
    r'dayName': PropertySchema(
      id: 1,
      name: r'dayName',
      type: IsarType.string,
    ),
    r'isRestDay': PropertySchema(
      id: 2,
      name: r'isRestDay',
      type: IsarType.bool,
    )
  },
  estimateSize: _workoutDayEstimateSize,
  serialize: _workoutDaySerialize,
  deserialize: _workoutDayDeserialize,
  deserializeProp: _workoutDayDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'exercises': LinkSchema(
      id: -5460152314316938935,
      name: r'exercises',
      target: r'WorkoutExercise',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _workoutDayGetId,
  getLinks: _workoutDayGetLinks,
  attach: _workoutDayAttach,
  version: '3.1.0+1',
);

int _workoutDayEstimateSize(
  WorkoutDay object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoriesSerialized.length * 3;
  bytesCount += 3 + object.dayName.length * 3;
  return bytesCount;
}

void _workoutDaySerialize(
  WorkoutDay object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoriesSerialized);
  writer.writeString(offsets[1], object.dayName);
  writer.writeBool(offsets[2], object.isRestDay);
}

WorkoutDay _workoutDayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutDay(
    dayName: reader.readString(offsets[1]),
    isRestDay: reader.readBool(offsets[2]),
  );
  object.categoriesSerialized = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _workoutDayDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutDayGetId(WorkoutDay object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutDayGetLinks(WorkoutDay object) {
  return [object.exercises];
}

void _workoutDayAttach(IsarCollection<dynamic> col, Id id, WorkoutDay object) {
  object.id = id;
  object.exercises
      .attach(col, col.isar.collection<WorkoutExercise>(), r'exercises', id);
}

extension WorkoutDayQueryWhereSort
    on QueryBuilder<WorkoutDay, WorkoutDay, QWhere> {
  QueryBuilder<WorkoutDay, WorkoutDay, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutDayQueryWhere
    on QueryBuilder<WorkoutDay, WorkoutDay, QWhereClause> {
  QueryBuilder<WorkoutDay, WorkoutDay, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterWhereClause> idBetween(
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
}

extension WorkoutDayQueryFilter
    on QueryBuilder<WorkoutDay, WorkoutDay, QFilterCondition> {
  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoriesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoriesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoriesSerialized',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoriesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoriesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoriesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoriesSerialized',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriesSerialized',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      categoriesSerializedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoriesSerialized',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      dayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> dayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      dayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dayName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> isRestDayEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRestDay',
        value: value,
      ));
    });
  }
}

extension WorkoutDayQueryObject
    on QueryBuilder<WorkoutDay, WorkoutDay, QFilterCondition> {}

extension WorkoutDayQueryLinks
    on QueryBuilder<WorkoutDay, WorkoutDay, QFilterCondition> {
  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> exercises(
      FilterQuery<WorkoutExercise> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'exercises');
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      exercisesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exercises', length, true, length, true);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      exercisesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exercises', 0, true, 0, true);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      exercisesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exercises', 0, false, 999999, true);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      exercisesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exercises', 0, true, length, include);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      exercisesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exercises', length, include, 999999, true);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition>
      exercisesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'exercises', lower, includeLower, upper, includeUpper);
    });
  }
}

extension WorkoutDayQuerySortBy
    on QueryBuilder<WorkoutDay, WorkoutDay, QSortBy> {
  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy>
      sortByCategoriesSerialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriesSerialized', Sort.asc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy>
      sortByCategoriesSerializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriesSerialized', Sort.desc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> sortByDayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayName', Sort.asc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> sortByDayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayName', Sort.desc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> sortByIsRestDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.asc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> sortByIsRestDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.desc);
    });
  }
}

extension WorkoutDayQuerySortThenBy
    on QueryBuilder<WorkoutDay, WorkoutDay, QSortThenBy> {
  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy>
      thenByCategoriesSerialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriesSerialized', Sort.asc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy>
      thenByCategoriesSerializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriesSerialized', Sort.desc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> thenByDayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayName', Sort.asc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> thenByDayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayName', Sort.desc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> thenByIsRestDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.asc);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterSortBy> thenByIsRestDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRestDay', Sort.desc);
    });
  }
}

extension WorkoutDayQueryWhereDistinct
    on QueryBuilder<WorkoutDay, WorkoutDay, QDistinct> {
  QueryBuilder<WorkoutDay, WorkoutDay, QDistinct>
      distinctByCategoriesSerialized({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoriesSerialized',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QDistinct> distinctByDayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QDistinct> distinctByIsRestDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRestDay');
    });
  }
}

extension WorkoutDayQueryProperty
    on QueryBuilder<WorkoutDay, WorkoutDay, QQueryProperty> {
  QueryBuilder<WorkoutDay, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutDay, String, QQueryOperations>
      categoriesSerializedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoriesSerialized');
    });
  }

  QueryBuilder<WorkoutDay, String, QQueryOperations> dayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayName');
    });
  }

  QueryBuilder<WorkoutDay, bool, QQueryOperations> isRestDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRestDay');
    });
  }
}
