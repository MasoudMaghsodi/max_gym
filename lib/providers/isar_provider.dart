import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/workout_day.dart';
import '../models/exercise_category.dart';
import '../models/workout_exercise.dart';

final isarProvider = FutureProvider<Isar>((ref) async {
  return await getIsarInstance();
});

Future<Isar> getIsarInstance() async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open(
    [WorkoutDaySchema, ExerciseCategorySchema, WorkoutExerciseSchema],
    directory: dir.path,
  );
}

final workoutProvider = FutureProvider<List<WorkoutDay>>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return await isar.workoutDays.where().findAll();
});
