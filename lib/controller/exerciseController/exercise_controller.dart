import 'package:isar/isar.dart';
import '../../model/exerciseModel/exercise_model.dart';

class ExerciseController {
  final Isar isar;

  ExerciseController(this.isar);

  Future<List<Exercise>> getExercisesByMuscle(int muscleGroupId) async {
    final exercises = await isar.exercises.where().findAll();

    // فیلتر دستی بر اساس muscleGroupId
    final filteredExercises = exercises.where((exercise) {
      exercise.muscleGroup.loadSync(); // بارگذاری IsarLink
      return exercise.muscleGroup.value?.id == muscleGroupId;
    }).toList();

    return filteredExercises;
  }
}
