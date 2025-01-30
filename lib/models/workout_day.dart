import 'package:isar/isar.dart';
import 'exercise_category.dart';
import 'workout_exercise.dart';

part 'workout_day.g.dart';

@Collection()
class WorkoutDay {
  Id id = Isar.autoIncrement;
  late String dayName;
  late bool isRestDay;
  final exercises = IsarLinks<WorkoutExercise>();

  late String categoriesSerialized;

  WorkoutDay({
    required this.dayName,
    required this.isRestDay,
    List<ExerciseCategory> categories = const [],
  }) : categoriesSerialized = categories.map((e) => e.name).join(',');

  @ignore
  List<ExerciseCategory> get categoriesList => categoriesSerialized
      .split(',')
      .map((e) => ExerciseCategory(e, ''))
      .toList();

  set categoriesList(List<ExerciseCategory> value) {
    categoriesSerialized = value.map((e) => e.name).join(',');
  }

  List<WorkoutExercise> getExercisesList() {
    return exercises.toList();
  }

  void setExercisesList(List<WorkoutExercise> value) {
    exercises.clear();
    exercises.addAll(value);
  }

  WorkoutDay copyWith({
    String? dayName,
    List<ExerciseCategory>? categories,
    bool? isRestDay,
    List<WorkoutExercise>? exercises,
  }) {
    final updatedWorkoutDay = WorkoutDay(
      dayName: dayName ?? this.dayName,
      isRestDay: isRestDay ?? this.isRestDay,
      categories: categories ?? categoriesList,
    );
    updatedWorkoutDay.setExercisesList(exercises ?? getExercisesList());
    return updatedWorkoutDay;
  }
}
