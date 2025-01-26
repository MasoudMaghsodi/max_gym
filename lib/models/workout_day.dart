import 'exercise_category.dart';
import 'workout_exercise.dart';

class WorkoutDay {
  String dayName;
  List<ExerciseCategory> categories;
  List<WorkoutExercise> exercises;
  bool isRestDay;

  WorkoutDay(this.dayName, this.categories, this.exercises,
      {this.isRestDay = false});
}
