import 'package:riverpod/riverpod.dart';
import 'package:isar/isar.dart';
import '../../model/muscle_teq_model/muscle_group_model.dart';
import '../isarProviders/isar_provider.dart';

// این Provider از Isar داده‌های گروه‌های عضلانی رو می‌گیره
final muscleGroupProvider = FutureProvider<List<MuscleGroup>>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return await isar.muscleGroups.where().findAll();
});
