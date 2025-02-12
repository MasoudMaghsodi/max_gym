import 'package:isar/isar.dart';
import '../models/athlete_model.dart';
import '../models/workout_model.dart';

/// مدیریت داده‌های محلی با استفاده از Isar
class LocalDataSource {
  final Isar isar;

  LocalDataSource(this.isar);

  Future<List<Athlete>> getUnsyncedAthletes() async {
    try {
      return await isar.athletes
          .where()
          .filter()
          .isSyncedEqualTo(false)
          .findAll();
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت ورزشکارهای سینک نشده: $e\n$stackTrace');
    }
  }

  Future<void> markAthleteAsSynced(int id) async {
    try {
      await isar.writeTxn(() async {
        final athlete = await isar.athletes.get(id);
        if (athlete != null) {
          athlete.isSynced = true;
          await isar.athletes.put(athlete);
        }
      });
    } catch (e, stackTrace) {
      throw Exception(
          'خطا در علامت‌گذاری ورزشکار به عنوان سینک شده: $e\n$stackTrace');
    }
  }

  // ورزشکاران
  Future<List<Athlete>> getAllAthletes() async {
    try {
      return await isar.athletes.where().findAll();
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت ورزشکاران: $e\n$stackTrace');
    }
  }

  /// ذخیره تک ورزشکار
  Future<void> saveAthlete(Athlete athlete) async {
    try {
      await isar.writeTxn(() async {
        await isar.athletes.put(athlete);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره ورزشکار: $e\n$stackTrace');
    }
  }

  /// ذخیره گروهی ورزشکاران
  Future<void> saveAthletes(List<Athlete> athletes) async {
    try {
      await isar.writeTxn(() async {
        await isar.athletes.putAll(athletes);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره ورزشکاران: $e\n$stackTrace');
    }
  }

  Future<void> deleteAthlete(int id) async {
    try {
      await isar.writeTxn(() async {
        await isar.athletes.delete(id);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف ورزشکار: $e\n$stackTrace');
    }
  }

  // برنامه‌های تمرینی
  Future<List<WorkoutPlan>> getWorkoutPlansByAthleteId(int athleteId) async {
    try {
      return await isar.workoutPlans
          .where()
          .athleteIdEqualTo(athleteId)
          .findAll();
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت برنامه‌های تمرینی: $e\n$stackTrace');
    }
  }

  /// ذخیره تک برنامه تمرینی
  Future<void> saveWorkoutPlan(WorkoutPlan workoutPlan) async {
    try {
      await isar.writeTxn(() async {
        await isar.workoutPlans.put(workoutPlan);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره برنامه: $e\n$stackTrace');
    }
  }

  /// ذخیره گروهی برنامه‌های تمرینی
  Future<void> saveWorkoutPlans(List<WorkoutPlan> workouts) async {
    try {
      await isar.writeTxn(() async {
        await isar.workoutPlans.putAll(workouts);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره برنامه‌ها: $e\n$stackTrace');
    }
  }

  Future<void> deleteWorkoutPlan(int id) async {
    try {
      await isar.writeTxn(() async {
        await isar.workoutPlans.delete(id);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف برنامه تمرینی: $e\n$stackTrace');
    }
  }
}
