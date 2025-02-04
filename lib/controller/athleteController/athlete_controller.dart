import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../model/athleteModel/athlete_model.dart';
import '../../providers/isarProviders/isar_provider.dart';

// StateNotifier برای مدیریت لیست ورزشکاران
class AthleteController extends StateNotifier<List<Athlete>> {
  final Isar isar;

  AthleteController(this.isar) : super([]) {
    fetchAthletes(); // Automatically fetch athletes when initialized
  }

  // دریافت تمام Athleteها و به‌روزرسانی state
  Future<void> fetchAthletes() async {
    state = await isar.athletes.where().findAll();
  }

  // ذخیره Athlete جدید
  Future<void> saveAthlete(Athlete athlete) async {
    await isar.writeTxn(() => isar.athletes.put(athlete));
    await fetchAthletes(); // به‌روزرسانی لیست پس از ذخیره
  }

  // حذف Athlete
  Future<void> deleteAthlete(int id) async {
    await isar.writeTxn(() => isar.athletes.delete(id));
    await fetchAthletes(); // به‌روزرسانی لیست پس از حذف
  }

  // حذف تمام Athleteها
  Future<void> deleteAllAthletes() async {
    await isar.writeTxn(() => isar.athletes.clear());
    state = []; // پاک کردن لیست
  }

  // به‌روزرسانی Athlete
  Future<void> updateAthlete(Athlete athlete) async {
    await isar.writeTxn(() => isar.athletes.put(athlete));
    await fetchAthletes(); // به‌روزرسانی لیست پس از به‌روزرسانی
  }
}

// StateNotifierProvider برای AthleteController
final athleteProvider = StateNotifierProvider<AthleteController, List<Athlete>>(
  (ref) {
    final isar = ref.watch(isarProvider).value;
    if (isar == null) {
      throw Exception('Isar database is not initialized');
    }
    return AthleteController(isar);
  },
);
