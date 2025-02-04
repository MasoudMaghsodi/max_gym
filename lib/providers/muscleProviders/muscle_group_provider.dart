import 'package:riverpod/riverpod.dart';
import 'package:isar/isar.dart';
import '../../model/muscle_teq_model/muscle_group_model.dart';
import '../isarProviders/isar_provider.dart';

// Provider for fetching all muscle groups
final muscleGroupProvider = FutureProvider<List<MuscleGroup>>((ref) async {
  try {
    // Watch the Isar instance and ensure it's initialized
    final isar = await ref.watch(isarProvider.future);

    // Fetch all muscle groups from the database
    return await isar.muscleGroups.where().findAll();
  } catch (e) {
    throw Exception('⚠️ خطا در دریافت گروه‌های عضلانی: ${e.toString()}');
  }
});
