import 'package:isar/isar.dart';
import 'package:riverpod/riverpod.dart';

import '../../model/exerciseModel/exercise_model.dart';
import '../isarProviders/isar_provider.dart';

final exerciseListProvider =
    FutureProvider.family<List<Exercise>, int>((ref, muscleGroupId) async {
  final isar = ref.watch(isarProvider).value!;
  final exercises = await isar.exercises.where().findAll();

  // فیلتر دستی بر اساس muscleGroupId
  final filteredExercises = exercises.where((exercise) {
    exercise.muscleGroup.loadSync(); // بارگذاری IsarLink
    return exercise.muscleGroup.value?.id == muscleGroupId;
  }).toList();

  return filteredExercises;
});
