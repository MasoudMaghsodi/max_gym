import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';
import '../isarProviders/isar_provider.dart';

// Provider for AthleteController
final athleteProvider = Provider<AthleteController?>((ref) {
  final isar = ref.watch(isarProvider).value;
  return isar != null ? AthleteController(isar) : null;
});

// AthleteController Class
class AthleteController {
  final Isar isar;

  AthleteController(this.isar);

  /// افزودن ورزشکار جدید با ID خودکار
  Future<int> addAthlete(Athlete athlete) async {
    try {
      return await isar.writeTxn(() => isar.athletes.put(athlete));
    } catch (e) {
      throw Exception('⚠️ خطا در ایجاد ورزشکار جدید: ${e.toString()}');
    }
  }

  /// حذف همه ورزشکاران
  Future<void> deleteAllAthletes() async {
    try {
      await isar.writeTxn(() => isar.athletes.clear());
    } catch (e) {
      throw Exception('⚠️ خطا در حذف کلیه ورزشکاران: ${e.toString()}');
    }
  }

  /// حذف ورزشکار بر اساس شناسه
  Future<bool> deleteAthlete(int id) async {
    try {
      return await isar.writeTxn(() => isar.athletes.delete(id));
    } catch (e) {
      throw Exception('⚠️ خطا در حذف ورزشکار: ${e.toString()}');
    }
  }

  /// دریافت لیست تمام ورزشکاران
  Future<List<Athlete>> getAllAthletes() async {
    try {
      return await isar.athletes.where().findAll();
    } catch (e) {
      throw Exception('⚠️ خطا در دریافت لیست ورزشکاران: ${e.toString()}');
    }
  }

  /// به‌روزرسانی اطلاعات ورزشکار
  Future<void> updateAthlete(Athlete athlete) async {
    try {
      await isar.writeTxn(() => isar.athletes.put(athlete));
    } catch (e) {
      throw Exception('⚠️ خطا در به‌روزرسانی اطلاعات: ${e.toString()}');
    }
  }

  /// ایجاد کپی از ورزشکار با ID جدید
  Future<Athlete> duplicateAthlete(Athlete original) async {
    try {
      final newAthlete = original.copyWith(id: Isar.autoIncrement);
      await isar.writeTxn(() => isar.athletes.put(newAthlete));
      return newAthlete;
    } catch (e) {
      throw Exception('⚠️ خطا در ایجاد کپی: ${e.toString()}');
    }
  }
}
