// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutExerciseCollection on Isar {
  IsarCollection<WorkoutExercise> get workoutExercises => this.collection();
}

const WorkoutExerciseSchema = CollectionSchema(
  name: r'WorkoutExercise',
  id: 9115529306380274138,
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
    r'superSet': PropertySchema(
      id: 3,
      name: r'superSet',
      type: IsarType.string,
    ),
    r'superSetReps': PropertySchema(
      id: 4,
      name: r'superSetReps',
      type: IsarType.long,
    ),
    r'superSetSets': PropertySchema(
      id: 5,
      name: r'superSetSets',
      type: IsarType.long,
    ),
    r'superSetTechnique': PropertySchema(
      id: 6,
      name: r'superSetTechnique',
      type: IsarType.string,
    ),
    r'technique': PropertySchema(
      id: 7,
      name: r'technique',
      type: IsarType.string,
    ),
    r'triSet': PropertySchema(
      id: 8,
      name: r'triSet',
      type: IsarType.string,
    ),
    r'triSetReps': PropertySchema(
      id: 9,
      name: r'triSetReps',
      type: IsarType.long,
    ),
    r'triSetSets': PropertySchema(
      id: 10,
      name: r'triSetSets',
      type: IsarType.long,
    ),
    r'triSetTechnique': PropertySchema(
      id: 11,
      name: r'triSetTechnique',
      type: IsarType.string,
    )
  },
  estimateSize: _workoutExerciseEstimateSize,
  serialize: _workoutExerciseSerialize,
  deserialize: _workoutExerciseDeserialize,
  deserializeProp: _workoutExerciseDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _workoutExerciseGetId,
  getLinks: _workoutExerciseGetLinks,
  attach: _workoutExerciseAttach,
  version: '3.1.0+1',
);

int _workoutExerciseEstimateSize(
  WorkoutExercise object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.superSet;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.superSetTechnique;
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
    final value = object.triSet;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.triSetTechnique;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _workoutExerciseSerialize(
  WorkoutExercise object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeLong(offsets[1], object.reps);
  writer.writeLong(offsets[2], object.sets);
  writer.writeString(offsets[3], object.superSet);
  writer.writeLong(offsets[4], object.superSetReps);
  writer.writeLong(offsets[5], object.superSetSets);
  writer.writeString(offsets[6], object.superSetTechnique);
  writer.writeString(offsets[7], object.technique);
  writer.writeString(offsets[8], object.triSet);
  writer.writeLong(offsets[9], object.triSetReps);
  writer.writeLong(offsets[10], object.triSetSets);
  writer.writeString(offsets[11], object.triSetTechnique);
}

WorkoutExercise _workoutExerciseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutExercise(
    reader.readString(offsets[0]),
    reader.readLong(offsets[2]),
    reader.readLong(offsets[1]),
    superSet: reader.readStringOrNull(offsets[3]),
    superSetReps: reader.readLongOrNull(offsets[4]),
    superSetSets: reader.readLongOrNull(offsets[5]),
    superSetTechnique: reader.readStringOrNull(offsets[6]),
    technique: reader.readStringOrNull(offsets[7]),
    triSet: reader.readStringOrNull(offsets[8]),
    triSetReps: reader.readLongOrNull(offsets[9]),
    triSetSets: reader.readLongOrNull(offsets[10]),
    triSetTechnique: reader.readStringOrNull(offsets[11]),
  );
  object.id = id;
  return object;
}

P _workoutExerciseDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutExerciseGetId(WorkoutExercise object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutExerciseGetLinks(WorkoutExercise object) {
  return [];
}

void _workoutExerciseAttach(
    IsarCollection<dynamic> col, Id id, WorkoutExercise object) {
  object.id = id;
}

extension WorkoutExerciseQueryWhereSort
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QWhere> {
  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutExerciseQueryWhere
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QWhereClause> {
  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhereClause> idBetween(
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension WorkoutExerciseQueryFilter
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QFilterCondition> {
  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameEqualTo(
    String value, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameLessThan(
    String value, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      repsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      repsGreaterThan(
    int value, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      repsLessThan(
    int value, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      repsBetween(
    int lower,
    int upper, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      setsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      setsGreaterThan(
    int value, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      setsLessThan(
    int value, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      setsBetween(
    int lower,
    int upper, {
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'superSet',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'superSet',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'superSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'superSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'superSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'superSet',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'superSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'superSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'superSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'superSet',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'superSet',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'superSet',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetRepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'superSetReps',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetRepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'superSetReps',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetRepsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'superSetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetRepsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'superSetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetRepsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'superSetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetRepsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'superSetReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetSetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'superSetSets',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetSetsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'superSetSets',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetSetsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'superSetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetSetsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'superSetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetSetsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'superSetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetSetsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'superSetSets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'superSetTechnique',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'superSetTechnique',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'superSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'superSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'superSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'superSetTechnique',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'superSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'superSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'superSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'superSetTechnique',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'superSetTechnique',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      superSetTechniqueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'superSetTechnique',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      techniqueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      techniqueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technique',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
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

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      techniqueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      techniqueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technique',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      techniqueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      techniqueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technique',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'triSet',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'triSet',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'triSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'triSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'triSet',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'triSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'triSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'triSet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'triSet',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triSet',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'triSet',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetRepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'triSetReps',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetRepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'triSetReps',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetRepsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triSetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetRepsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'triSetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetRepsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'triSetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetRepsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'triSetReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetSetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'triSetSets',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetSetsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'triSetSets',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetSetsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triSetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetSetsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'triSetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetSetsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'triSetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetSetsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'triSetSets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'triSetTechnique',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'triSetTechnique',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'triSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'triSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'triSetTechnique',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'triSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'triSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'triSetTechnique',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'triSetTechnique',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triSetTechnique',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterFilterCondition>
      triSetTechniqueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'triSetTechnique',
        value: '',
      ));
    });
  }
}

extension WorkoutExerciseQueryObject
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QFilterCondition> {}

extension WorkoutExerciseQueryLinks
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QFilterCondition> {}

extension WorkoutExerciseQuerySortBy
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QSortBy> {
  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> sortByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> sortBySets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSet', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSet', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSetTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetTechnique', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortBySuperSetTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetTechnique', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> sortByTriSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSet', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTriSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSet', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTriSetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTriSetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTriSetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTriSetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTriSetTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetTechnique', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      sortByTriSetTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetTechnique', Sort.desc);
    });
  }
}

extension WorkoutExerciseQuerySortThenBy
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QSortThenBy> {
  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> thenByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> thenBySets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSet', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSet', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSetTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetTechnique', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenBySuperSetTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'superSetTechnique', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technique', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy> thenByTriSet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSet', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTriSetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSet', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTriSetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTriSetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTriSetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTriSetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTriSetTechnique() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetTechnique', Sort.asc);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QAfterSortBy>
      thenByTriSetTechniqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triSetTechnique', Sort.desc);
    });
  }
}

extension WorkoutExerciseQueryWhereDistinct
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct> {
  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct> distinctByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reps');
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct> distinctBySets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sets');
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct> distinctBySuperSet(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'superSet', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct>
      distinctBySuperSetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'superSetReps');
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct>
      distinctBySuperSetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'superSetSets');
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct>
      distinctBySuperSetTechnique({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'superSetTechnique',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct> distinctByTechnique(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technique', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct> distinctByTriSet(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'triSet', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct>
      distinctByTriSetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'triSetReps');
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct>
      distinctByTriSetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'triSetSets');
    });
  }

  QueryBuilder<WorkoutExercise, WorkoutExercise, QDistinct>
      distinctByTriSetTechnique({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'triSetTechnique',
          caseSensitive: caseSensitive);
    });
  }
}

extension WorkoutExerciseQueryProperty
    on QueryBuilder<WorkoutExercise, WorkoutExercise, QQueryProperty> {
  QueryBuilder<WorkoutExercise, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutExercise, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<WorkoutExercise, int, QQueryOperations> repsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reps');
    });
  }

  QueryBuilder<WorkoutExercise, int, QQueryOperations> setsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sets');
    });
  }

  QueryBuilder<WorkoutExercise, String?, QQueryOperations> superSetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'superSet');
    });
  }

  QueryBuilder<WorkoutExercise, int?, QQueryOperations> superSetRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'superSetReps');
    });
  }

  QueryBuilder<WorkoutExercise, int?, QQueryOperations> superSetSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'superSetSets');
    });
  }

  QueryBuilder<WorkoutExercise, String?, QQueryOperations>
      superSetTechniqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'superSetTechnique');
    });
  }

  QueryBuilder<WorkoutExercise, String?, QQueryOperations> techniqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technique');
    });
  }

  QueryBuilder<WorkoutExercise, String?, QQueryOperations> triSetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'triSet');
    });
  }

  QueryBuilder<WorkoutExercise, int?, QQueryOperations> triSetRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'triSetReps');
    });
  }

  QueryBuilder<WorkoutExercise, int?, QQueryOperations> triSetSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'triSetSets');
    });
  }

  QueryBuilder<WorkoutExercise, String?, QQueryOperations>
      triSetTechniqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'triSetTechnique');
    });
  }
}
