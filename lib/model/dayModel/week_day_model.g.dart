// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_day_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeekDayCollection on Isar {
  IsarCollection<WeekDay> get weekDays => this.collection();
}

const WeekDaySchema = CollectionSchema(
  name: r'WeekDay',
  id: 6166972984425360650,
  properties: {
    r'day': PropertySchema(
      id: 0,
      name: r'day',
      type: IsarType.string,
      enumMap: _WeekDaydayEnumValueMap,
    ),
    r'isActive': PropertySchema(
      id: 1,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'persianName': PropertySchema(
      id: 2,
      name: r'persianName',
      type: IsarType.string,
    ),
    r'targetMuscleGroups': PropertySchema(
      id: 3,
      name: r'targetMuscleGroups',
      type: IsarType.stringList,
    )
  },
  estimateSize: _weekDayEstimateSize,
  serialize: _weekDaySerialize,
  deserialize: _weekDayDeserialize,
  deserializeProp: _weekDayDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _weekDayGetId,
  getLinks: _weekDayGetLinks,
  attach: _weekDayAttach,
  version: '3.1.0+1',
);

int _weekDayEstimateSize(
  WeekDay object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.day.name.length * 3;
  bytesCount += 3 + object.persianName.length * 3;
  bytesCount += 3 + object.targetMuscleGroups.length * 3;
  {
    for (var i = 0; i < object.targetMuscleGroups.length; i++) {
      final value = object.targetMuscleGroups[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _weekDaySerialize(
  WeekDay object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.day.name);
  writer.writeBool(offsets[1], object.isActive);
  writer.writeString(offsets[2], object.persianName);
  writer.writeStringList(offsets[3], object.targetMuscleGroups);
}

WeekDay _weekDayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeekDay();
  object.day = _WeekDaydayValueEnumMap[reader.readStringOrNull(offsets[0])] ??
      Day.saturday;
  object.id = id;
  object.isActive = reader.readBool(offsets[1]);
  object.targetMuscleGroups = reader.readStringList(offsets[3]) ?? [];
  return object;
}

P _weekDayDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_WeekDaydayValueEnumMap[reader.readStringOrNull(offset)] ??
          Day.saturday) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WeekDaydayEnumValueMap = {
  r'saturday': r'saturday',
  r'sunday': r'sunday',
  r'monday': r'monday',
  r'tuesday': r'tuesday',
  r'wednesday': r'wednesday',
  r'thursday': r'thursday',
  r'friday': r'friday',
};
const _WeekDaydayValueEnumMap = {
  r'saturday': Day.saturday,
  r'sunday': Day.sunday,
  r'monday': Day.monday,
  r'tuesday': Day.tuesday,
  r'wednesday': Day.wednesday,
  r'thursday': Day.thursday,
  r'friday': Day.friday,
};

Id _weekDayGetId(WeekDay object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weekDayGetLinks(WeekDay object) {
  return [];
}

void _weekDayAttach(IsarCollection<dynamic> col, Id id, WeekDay object) {
  object.id = id;
}

extension WeekDayQueryWhereSort on QueryBuilder<WeekDay, WeekDay, QWhere> {
  QueryBuilder<WeekDay, WeekDay, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WeekDayQueryWhere on QueryBuilder<WeekDay, WeekDay, QWhereClause> {
  QueryBuilder<WeekDay, WeekDay, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<WeekDay, WeekDay, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterWhereClause> idBetween(
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

extension WeekDayQueryFilter
    on QueryBuilder<WeekDay, WeekDay, QFilterCondition> {
  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayEqualTo(
    Day value, {
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayGreaterThan(
    Day value, {
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayLessThan(
    Day value, {
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayBetween(
    Day lower,
    Day upper, {
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayStartsWith(
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayEndsWith(
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayContains(
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayMatches(
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> dayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'persianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'persianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'persianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'persianName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'persianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'persianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'persianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'persianName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition> persianNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'persianName',
        value: '',
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      persianNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'persianName',
        value: '',
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetMuscleGroups',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetMuscleGroups',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetMuscleGroups',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetMuscleGroups',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetMuscleGroups',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetMuscleGroups',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetMuscleGroups',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetMuscleGroups',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetMuscleGroups',
        value: '',
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetMuscleGroups',
        value: '',
      ));
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetMuscleGroups',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetMuscleGroups',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetMuscleGroups',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetMuscleGroups',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetMuscleGroups',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterFilterCondition>
      targetMuscleGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetMuscleGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension WeekDayQueryObject
    on QueryBuilder<WeekDay, WeekDay, QFilterCondition> {}

extension WeekDayQueryLinks
    on QueryBuilder<WeekDay, WeekDay, QFilterCondition> {}

extension WeekDayQuerySortBy on QueryBuilder<WeekDay, WeekDay, QSortBy> {
  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> sortByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> sortByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> sortByPersianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persianName', Sort.asc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> sortByPersianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persianName', Sort.desc);
    });
  }
}

extension WeekDayQuerySortThenBy
    on QueryBuilder<WeekDay, WeekDay, QSortThenBy> {
  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenByPersianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persianName', Sort.asc);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QAfterSortBy> thenByPersianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persianName', Sort.desc);
    });
  }
}

extension WeekDayQueryWhereDistinct
    on QueryBuilder<WeekDay, WeekDay, QDistinct> {
  QueryBuilder<WeekDay, WeekDay, QDistinct> distinctByDay(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<WeekDay, WeekDay, QDistinct> distinctByPersianName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'persianName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeekDay, WeekDay, QDistinct> distinctByTargetMuscleGroups() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetMuscleGroups');
    });
  }
}

extension WeekDayQueryProperty
    on QueryBuilder<WeekDay, WeekDay, QQueryProperty> {
  QueryBuilder<WeekDay, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeekDay, Day, QQueryOperations> dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day');
    });
  }

  QueryBuilder<WeekDay, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<WeekDay, String, QQueryOperations> persianNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'persianName');
    });
  }

  QueryBuilder<WeekDay, List<String>, QQueryOperations>
      targetMuscleGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetMuscleGroups');
    });
  }
}
