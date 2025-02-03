import 'package:isar/isar.dart';
import 'package:max_gym/model/muscle_teq_model/muscle_group_model.dart';
import 'package:riverpod/riverpod.dart';

import '../../model/exerciseModel/exercise_model.dart';
import '../isarProviders/isar_provider.dart';

final exerciseListProvider =
    FutureProvider.family<List<Exercise>, int>((ref, muscleGroupId) async {
  final isar = ref.watch(isarProvider).value!;
  final exercises = await isar.exercises
      .filter()
      .muscleGroup((q) => q.idEqualTo(muscleGroupId))
      .findAll();

  // فیلتر دستی بر اساس muscleGroupId حذف شده و از فیلتر داخلی استفاده شده است
  return exercises;
});
