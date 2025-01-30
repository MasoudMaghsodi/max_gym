// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_category.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExerciseCategoryCollection on Isar {
  IsarCollection<ExerciseCategory> get exerciseCategorys => this.collection();
}

const ExerciseCategorySchema = CollectionSchema(
  name: r'ExerciseCategory',
  id: -9190488424608949912,
  properties: {
    r'exercisesList': PropertySchema(
      id: 0,
      name: r'exercisesList',
      type: IsarType.stringList,
    ),
    r'exercisesSerialized': PropertySchema(
      id: 1,
      name: r'exercisesSerialized',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _exerciseCategoryEstimateSize,
  serialize: _exerciseCategorySerialize,
  deserialize: _exerciseCategoryDeserialize,
  deserializeProp: _exerciseCategoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _exerciseCategoryGetId,
  getLinks: _exerciseCategoryGetLinks,
  attach: _exerciseCategoryAttach,
  version: '3.1.0+1',
);

int _exerciseCategoryEstimateSize(
  ExerciseCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exercisesList.length * 3;
  {
    for (var i = 0; i < object.exercisesList.length; i++) {
      final value = object.exercisesList[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.exercisesSerialized.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _exerciseCategorySerialize(
  ExerciseCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.exercisesList);
  writer.writeString(offsets[1], object.exercisesSerialized);
  writer.writeString(offsets[2], object.name);
}

ExerciseCategory _exerciseCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExerciseCategory(
    reader.readString(offsets[2]),
    reader.readString(offsets[1]),
  );
  object.exercisesList = reader.readStringList(offsets[0]) ?? [];
  object.id = id;
  return object;
}

P _exerciseCategoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _exerciseCategoryGetId(ExerciseCategory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _exerciseCategoryGetLinks(ExerciseCategory object) {
  return [];
}

void _exerciseCategoryAttach(
    IsarCollection<dynamic> col, Id id, ExerciseCategory object) {
  object.id = id;
}

extension ExerciseCategoryQueryWhereSort
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QWhere> {
  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExerciseCategoryQueryWhere
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QWhereClause> {
  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterWhereClause>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterWhereClause> idBetween(
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

extension ExerciseCategoryQueryFilter
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QFilterCondition> {
  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercisesList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exercisesList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exercisesList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exercisesList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exercisesList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exercisesList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exercisesList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exercisesList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercisesList',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercisesList',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exercisesList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exercisesList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exercisesList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exercisesList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exercisesList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exercisesList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercisesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exercisesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exercisesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exercisesSerialized',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exercisesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exercisesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exercisesSerialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exercisesSerialized',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercisesSerialized',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      exercisesSerializedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercisesSerialized',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
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

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ExerciseCategoryQueryObject
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QFilterCondition> {}

extension ExerciseCategoryQueryLinks
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QFilterCondition> {}

extension ExerciseCategoryQuerySortBy
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QSortBy> {
  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy>
      sortByExercisesSerialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisesSerialized', Sort.asc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy>
      sortByExercisesSerializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisesSerialized', Sort.desc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ExerciseCategoryQuerySortThenBy
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QSortThenBy> {
  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy>
      thenByExercisesSerialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisesSerialized', Sort.asc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy>
      thenByExercisesSerializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisesSerialized', Sort.desc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ExerciseCategoryQueryWhereDistinct
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QDistinct> {
  QueryBuilder<ExerciseCategory, ExerciseCategory, QDistinct>
      distinctByExercisesList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercisesList');
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QDistinct>
      distinctByExercisesSerialized({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercisesSerialized',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseCategory, ExerciseCategory, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension ExerciseCategoryQueryProperty
    on QueryBuilder<ExerciseCategory, ExerciseCategory, QQueryProperty> {
  QueryBuilder<ExerciseCategory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExerciseCategory, List<String>, QQueryOperations>
      exercisesListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercisesList');
    });
  }

  QueryBuilder<ExerciseCategory, String, QQueryOperations>
      exercisesSerializedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercisesSerialized');
    });
  }

  QueryBuilder<ExerciseCategory, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
