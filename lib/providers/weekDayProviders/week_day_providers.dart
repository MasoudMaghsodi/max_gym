import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../model/dayModel/week_day_model.dart';
import '../isarProviders/isar_provider.dart';

// Provider برای دریافت روزها
final weekDaysProvider = FutureProvider<List<WeekDay>>((ref) async {
  try {
    final isar = await ref.watch(isarProvider.future);
    final days = await isar.weekDays.where().findAll();

    if (days.isEmpty) {
      // اگر روزی وجود نداشت، روزهای اولیه را ایجاد کنید
      final initialDays = WeekDay.initialDays();
      await isar.writeTxn(() => isar.weekDays.putAll(initialDays));
      return initialDays;
    }

    return days;
  } catch (e) {
    throw Exception('⚠️ خطا در دریافت روزهای هفته: ${e.toString()}');
  }
});

// StateProvider برای مدیریت وضعیت تغییر روزها
final toggleDayStatusProvider = StateProvider.family<bool, int>((ref, id) {
  final days = ref.watch(weekDaysProvider).asData?.value ?? [];
  final day = days.firstWhere((day) => day.id == id, orElse: () => WeekDay());
  return day.isActive;
});

// متد برای تغییر وضعیت روز
Future<void> toggleDayStatus(WidgetRef ref, int id, bool value) async {
  try {
    final isar = await ref.watch(isarProvider.future);
    final days = ref.read(weekDaysProvider).asData?.value ?? [];

    final index = days.indexWhere((day) => day.id == id);
    if (index == -1) return;

    final updatedDay = days[index].copyWith(isActive: value);
    await isar.writeTxn(() => isar.weekDays.put(updatedDay));

    // Update the state in Riverpod
    ref.read(toggleDayStatusProvider(id).notifier).state = value;
  } catch (e) {
    throw Exception('⚠️ خطا در تغییر وضعیت روز: ${e.toString()}');
  }
}
