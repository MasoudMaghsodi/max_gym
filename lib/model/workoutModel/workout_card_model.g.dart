// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_card_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutCardCollection on Isar {
  IsarCollection<WorkoutCard> get workoutCards => this.collection();
}

const WorkoutCardSchema = CollectionSchema(
  name: r'WorkoutCard',
  id: 5297060475056040231,
  properties: {
    r'athleteId': PropertySchema(
      id: 0,
      name: r'athleteId',
      type: IsarType.long,
    ),
    r'exerciseId': PropertySchema(
      id: 1,
      name: r'exerciseId',
      type: IsarType.long,
    ),
    r'isValid': PropertySchema(
      id: 2,
      name: r'isValid',
      type: IsarType.bool,
    ),
    r'muscleGroupId': PropertySchema(
      id: 3,
      name: r'muscleGroupId',
      type: IsarType.long,
    ),
    r'reps': PropertySchema(
      id: 4,
      name: r'reps',
      type: IsarType.long,
    ),
    r'sets': PropertySchema(
      id: 5,
      name: r'sets',
      type: IsarType.long,
    ),
    r'supersetExerciseId': PropertySchema(
      id: 6,
      name: r'supersetExerciseId',
      type: IsarType.long,
    ),
    r'supersetReps': PropertySchema(
      id: 7,
      name: r'supersetReps',
      type: IsarType.long,
    ),
    r'supersetSets': PropertySchema(
      id: 8,
      name: r'supersetSets',
      type: IsarType.long,
    ),
    r'supersetTechniqueId': PropertySchema(
      id: 9,
      name: r'supersetTechniqueId',
      type: IsarType.long,
    ),
    r'techniqueId': PropertySchema(
      id: 10,
      name: r'techniqueId',
      type: IsarType.long,
    ),
    r'trisetExerciseId': PropertySchema(
      id: 11,
      name: r'trisetExerciseId',
      type: IsarType.long,
    ),
    r'trisetReps': PropertySchema(
      id: 12,
      name: r'trisetReps',
      type: IsarType.long,
    ),
    r'trisetSets': PropertySchema(
      id: 13,
      name: r'trisetSets',
      type: IsarType.long,
    ),
    r'trisetTechniqueId': PropertySchema(
      id: 14,
      name: r'trisetTechniqueId',
      type: IsarType.long,
    )
  },
  estimateSize: _workoutCardEstimateSize,
  serialize: _workoutCardSerialize,
  deserialize: _workoutCardDeserialize,
  deserializeProp: _workoutCardDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workoutCardGetId,
  getLinks: _workoutCardGetLinks,
  attach: _workoutCardAttach,
  version: '3.1.0+1',
);

int _workoutCardEstimateSize(
  WorkoutCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _workoutCardSerialize(
  WorkoutCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.athleteId);
  writer.writeLong(offsets[1], object.exerciseId);
  writer.writeBool(offsets[2], object.isValid);
  writer.writeLong(offsets[3], object.muscleGroupId);
  writer.writeLong(offsets[4], object.reps);
  writer.writeLong(offsets[5], object.sets);
  writer.writeLong(offsets[6], object.supersetExerciseId);
  writer.writeLong(offsets[7], object.supersetReps);
  writer.writeLong(offsets[8], object.supersetSets);
  writer.writeLong(offsets[9], object.supersetTechniqueId);
  writer.writeLong(offsets[10], object.techniqueId);
  writer.writeLong(offsets[11], object.trisetExerciseId);
  writer.writeLong(offsets[12], object.trisetReps);
  writer.writeLong(offsets[13], object.trisetSets);
  writer.writeLong(offsets[14], object.trisetTechniqueId);
}

WorkoutCard _workoutCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutCard(
    athleteId: reader.readLong(offsets[0]),
    exerciseId: reader.readLong(offsets[1]),
    id: id,
    muscleGroupId: reader.readLong(offsets[3]),
    reps: reader.readLong(offsets[4]),
    sets: reader.readLong(offsets[5]),
    supersetExerciseId: reader.readLongOrNull(offsets[6]),
    supersetReps: reader.readLongOrNull(offsets[7]),
    supersetSets: reader.readLongOrNull(offsets[8]),
    supersetTechniqueId: reader.readLongOrNull(offsets[9]),
    techniqueId: reader.readLongOrNull(offsets[10]),
    trisetExerciseId: reader.readLongOrNull(offsets[11]),
    trisetReps: reader.readLongOrNull(offsets[12]),
    trisetSets: reader.readLongOrNull(offsets[13]),
    trisetTechniqueId: reader.readLongOrNull(offsets[14]),
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
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutCardGetId(WorkoutCard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutCardGetLinks(WorkoutCard object) {
  return [];
}

void _workoutCardAttach(
    IsarCollection<dynamic> col, Id id, WorkoutCard object) {
  object.id = id;
}

extension WorkoutCardQueryWhereSort
    on QueryBuilder<WorkoutCard, WorkoutCard, QWhere> {
  QueryBuilder<WorkoutCard, WorkoutCard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutCardQueryWhere
    on QueryBuilder<WorkoutCard, WorkoutCard, QWhereClause> {
  QueryBuilder<WorkoutCard, WorkoutCard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterWhereClause> idBetween(
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

extension WorkoutCardQueryFilter
    on QueryBuilder<WorkoutCard, WorkoutCard, QFilterCondition> {
  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      athleteIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'athleteId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      exerciseIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> isValidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isValid',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      muscleGroupIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'muscleGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      muscleGroupIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'muscleGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      muscleGroupIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'muscleGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      muscleGroupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'muscleGroupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsGreaterThan(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsLessThan(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> repsBetween(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsGreaterThan(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsLessThan(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition> setsBetween(
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

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetExerciseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supersetExerciseId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetExerciseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supersetExerciseId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetExerciseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supersetExerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetExerciseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supersetExerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetExerciseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supersetExerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetExerciseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supersetExerciseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetRepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supersetReps',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetRepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supersetReps',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetRepsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supersetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetRepsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supersetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetRepsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supersetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetRepsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supersetReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetSetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supersetSets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetSetsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supersetSets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetSetsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supersetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetSetsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supersetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetSetsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supersetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetSetsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supersetSets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetTechniqueIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supersetTechniqueId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetTechniqueIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supersetTechniqueId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetTechniqueIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supersetTechniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetTechniqueIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supersetTechniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetTechniqueIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supersetTechniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      supersetTechniqueIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supersetTechniqueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'techniqueId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'techniqueId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'techniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'techniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'techniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      techniqueIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'techniqueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetExerciseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trisetExerciseId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetExerciseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trisetExerciseId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetExerciseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trisetExerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetExerciseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trisetExerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetExerciseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trisetExerciseId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetExerciseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trisetExerciseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetRepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trisetReps',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetRepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trisetReps',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetRepsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trisetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetRepsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trisetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetRepsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trisetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetRepsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trisetReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetSetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trisetSets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetSetsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trisetSets',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetSetsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trisetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetSetsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trisetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetSetsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trisetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetSetsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trisetSets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetTechniqueIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trisetTechniqueId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetTechniqueIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trisetTechniqueId',
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetTechniqueIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trisetTechniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetTechniqueIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trisetTechniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetTechniqueIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trisetTechniqueId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterFilterCondition>
      trisetTechniqueIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trisetTechniqueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkoutCardQueryObject
    on QueryBuilder<WorkoutCard, WorkoutCard, QFilterCondition> {}

extension WorkoutCardQueryLinks
    on QueryBuilder<WorkoutCard, WorkoutCard, QFilterCondition> {}

extension WorkoutCardQuerySortBy
    on QueryBuilder<WorkoutCard, WorkoutCard, QSortBy> {
  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByAthleteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByMuscleGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroupId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortByMuscleGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroupId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortBySets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortBySetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortBySupersetExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetExerciseId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortBySupersetExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetExerciseId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortBySupersetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortBySupersetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortBySupersetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortBySupersetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortBySupersetTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetTechniqueId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortBySupersetTechniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetTechniqueId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techniqueId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByTechniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techniqueId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortByTrisetExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetExerciseId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortByTrisetExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetExerciseId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByTrisetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByTrisetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByTrisetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> sortByTrisetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortByTrisetTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetTechniqueId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      sortByTrisetTechniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetTechniqueId', Sort.desc);
    });
  }
}

extension WorkoutCardQuerySortThenBy
    on QueryBuilder<WorkoutCard, WorkoutCard, QSortThenBy> {
  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByAthleteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByMuscleGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroupId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenByMuscleGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroupId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenBySets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenBySetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenBySupersetExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetExerciseId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenBySupersetExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetExerciseId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenBySupersetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenBySupersetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenBySupersetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenBySupersetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenBySupersetTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetTechniqueId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenBySupersetTechniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supersetTechniqueId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techniqueId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByTechniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techniqueId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenByTrisetExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetExerciseId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenByTrisetExerciseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetExerciseId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByTrisetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetReps', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByTrisetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetReps', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByTrisetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy> thenByTrisetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenByTrisetTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetTechniqueId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QAfterSortBy>
      thenByTrisetTechniqueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trisetTechniqueId', Sort.desc);
    });
  }
}

extension WorkoutCardQueryWhereDistinct
    on QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> {
  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'athleteId');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseId');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isValid');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByMuscleGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'muscleGroupId');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reps');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctBySets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sets');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct>
      distinctBySupersetExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supersetExerciseId');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctBySupersetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supersetReps');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctBySupersetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supersetSets');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct>
      distinctBySupersetTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supersetTechniqueId');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'techniqueId');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct>
      distinctByTrisetExerciseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trisetExerciseId');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByTrisetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trisetReps');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct> distinctByTrisetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trisetSets');
    });
  }

  QueryBuilder<WorkoutCard, WorkoutCard, QDistinct>
      distinctByTrisetTechniqueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trisetTechniqueId');
    });
  }
}

extension WorkoutCardQueryProperty
    on QueryBuilder<WorkoutCard, WorkoutCard, QQueryProperty> {
  QueryBuilder<WorkoutCard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutCard, int, QQueryOperations> athleteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'athleteId');
    });
  }

  QueryBuilder<WorkoutCard, int, QQueryOperations> exerciseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseId');
    });
  }

  QueryBuilder<WorkoutCard, bool, QQueryOperations> isValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isValid');
    });
  }

  QueryBuilder<WorkoutCard, int, QQueryOperations> muscleGroupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'muscleGroupId');
    });
  }

  QueryBuilder<WorkoutCard, int, QQueryOperations> repsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reps');
    });
  }

  QueryBuilder<WorkoutCard, int, QQueryOperations> setsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sets');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations>
      supersetExerciseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supersetExerciseId');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations> supersetRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supersetReps');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations> supersetSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supersetSets');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations>
      supersetTechniqueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supersetTechniqueId');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations> techniqueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'techniqueId');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations> trisetExerciseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trisetExerciseId');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations> trisetRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trisetReps');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations> trisetSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trisetSets');
    });
  }

  QueryBuilder<WorkoutCard, int?, QQueryOperations>
      trisetTechniqueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trisetTechniqueId');
    });
  }
}
