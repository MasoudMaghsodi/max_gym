import 'package:isar/isar.dart';
part 'week_day_model.g.dart';

enum Day { saturday, sunday, monday, tuesday, wednesday, thursday, friday }

@Collection()
class WeekDay {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  late Day day;

  late bool isActive;

  @Index()
  late List<String> targetMuscleGroups;

  // Default Constructor
  WeekDay() {
    isActive = false;
    targetMuscleGroups = [];
  }

  // CopyWith Method for Immutability
  WeekDay copyWith({
    Id? id,
    Day? day,
    bool? isActive,
    List<String>? targetMuscleGroups,
  }) {
    return WeekDay()
      ..id = id ?? this.id
      ..day = day ?? this.day
      ..isActive = isActive ?? this.isActive
      ..targetMuscleGroups = targetMuscleGroups != null
          ? List.from(targetMuscleGroups)
          : List.from(this.targetMuscleGroups);
  }

  // Persian Day Name Getter
  String get persianName {
    switch (day) {
      case Day.saturday:
        return 'شنبه';
      case Day.sunday:
        return 'یکشنبه';
      case Day.monday:
        return 'دوشنبه';
      case Day.tuesday:
        return 'سه‌شنبه';
      case Day.wednesday:
        return 'چهارشنبه';
      case Day.thursday:
        return 'پنجشنبه';
      case Day.friday:
        return 'جمعه';
    }
  }

  // Add Muscle Group
  void addMuscleGroup(String muscleGroup) {
    if (!targetMuscleGroups.contains(muscleGroup)) {
      targetMuscleGroups.add(muscleGroup);
    }
  }

  // Remove Muscle Group
  void removeMuscleGroup(String muscleGroup) {
    targetMuscleGroups.remove(muscleGroup);
  }

  // Validation Logic
  bool get isValid => validationError == null;

  String? get validationError {
    if (day == null) return 'روز هفته انتخاب نشده';
    if (isActive && targetMuscleGroups.isEmpty) {
      return 'حداقل یک عضله هدف انتخاب کنید';
    }
    return null;
  }

  // Static Method to Initialize Default Days
  static List<WeekDay> initialDays() {
    return Day.values.map((day) {
      return WeekDay()
        ..day = day
        ..isActive = day != Day.friday
        ..targetMuscleGroups = [];
    }).toList();
  }

  // Override toString for Debugging
  @override
  String toString() {
    return '''
WeekDay:
  id: $id
  day: $persianName
  isActive: $isActive
  targetMuscleGroups: ${targetMuscleGroups.join(', ')}
''';
  }
}
