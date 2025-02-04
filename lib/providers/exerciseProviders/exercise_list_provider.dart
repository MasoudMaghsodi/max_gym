import 'package:isar/isar.dart';
import 'package:max_gym/model/muscle_teq_model/muscle_group_model.dart';
import 'package:riverpod/riverpod.dart';
import '../../model/exerciseModel/exercise_model.dart';
import '../isarProviders/isar_provider.dart';

// Provider for fetching exercises based on muscleGroupId
final exerciseListProvider =
    FutureProvider.family<List<Exercise>, int>((ref, muscleGroupId) async {
  final isar = ref.watch(isarProvider).value;
  if (isar == null) {
    throw Exception('⚠️ Isar database is not initialized');
  }

  try {
    // Fetch exercises filtered by muscleGroupId using Isar's query system
    return await isar.exercises
        .filter()
        .muscleGroup((q) => q.idEqualTo(muscleGroupId))
        .findAll();
  } catch (e) {
    throw Exception('⚠️ خطا در دریافت تمرین‌ها: ${e.toString()}');
  }
});
