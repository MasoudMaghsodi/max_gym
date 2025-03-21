import 'package:isar/isar.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/exercise_model.dart' as exercise_model;
import 'package:max_gym/data/models/technique_model.dart';
import 'package:max_gym/data/models/offline_queue.dart';
import 'package:max_gym/data/models/workout_model.dart';

class LocalDataSource {
  final Isar isar;

  LocalDataSource(this.isar);

  // Athlete Methods
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

  Future<List<Athlete>> getAllAthletes({int limit = 10, int offset = 0}) async {
    try {
      return await isar.athletes.where().offset(offset).limit(limit).findAll();
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت ورزشکاران: $e\n$stackTrace');
    }
  }

  Future<List<Athlete>> searchAthletes(String query,
      {List<String>? filters, int limit = 10}) async {
    try {
      var athleteQuery = isar.athletes.where();

      // if (query.isNotEmpty) {
      //   athleteQuery = athleteQuery
      //       .filter()
      //       .firstNameContains(query)
      //       .or()
      //       .lastNameContains(query);
      // }

      final result = await athleteQuery.limit(limit).findAll();
      return result;
    } catch (e, stackTrace) {
      throw Exception('Error searching athletes: $e\n$stackTrace');
    }
  }

  Future<void> saveAthlete(Athlete athlete) async {
    try {
      await isar.writeTxn(() async {
        await isar.athletes.put(athlete);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره ورزشکار: $e\n$stackTrace');
    }
  }

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

  // Workout Methods
  Future<List<WorkoutPlan>> getWorkoutPlansByAthleteId(int athleteId,
      {int limit = 10}) async {
    try {
      return await isar.workoutPlans
          .filter()
          .athleteIdEqualTo(athleteId)
          .limit(limit)
          .findAll();
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت برنامه‌های تمرینی: $e\n$stackTrace');
    }
  }

  Future<void> saveWorkoutPlan(WorkoutPlan workoutPlan) async {
    try {
      await isar.writeTxn(() async {
        await isar.workoutPlans.put(workoutPlan);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره برنامه: $e\n$stackTrace');
    }
  }

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

  // Exercise Methods
  Future<List<exercise_model.Exercise>> getAllExercises() async {
    try {
      return await isar.collection<exercise_model.Exercise>().where().findAll();
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت تمرینات: $e\n$stackTrace');
    }
  }

  Future<void> saveExercise(exercise_model.Exercise exercise) async {
    try {
      await isar.writeTxn(() async {
        await isar.collection<exercise_model.Exercise>().put(exercise);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره تمرین: $e\n$stackTrace');
    }
  }

  Future<void> deleteExercise(int id) async {
    try {
      await isar.writeTxn(() async {
        await isar.collection<exercise_model.Exercise>().delete(id);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف تمرین: $e\n$stackTrace');
    }
  }

  // Technique Methods
  Future<List<Technique>> getAllTechniques() async {
    try {
      return await isar.techniques.where().findAll();
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت تکنیک‌ها: $e\n$stackTrace');
    }
  }

  Future<void> saveTechnique(Technique technique) async {
    try {
      await isar.writeTxn(() async {
        await isar.techniques.put(technique);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره تکنیک: $e\n$stackTrace');
    }
  }

  Future<void> deleteTechnique(int id) async {
    try {
      await isar.writeTxn(() async {
        await isar.techniques.delete(id);
      });
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف تکنیک: $e\n$stackTrace');
    }
  }

  // Offline Queue Methods
  Future<List<OfflineQueueItem>> getQueueItems() async {
    try {
      return await isar.offlineQueueItems.where().findAll();
    } catch (e) {
      return [];
    }
  }

  Future<void> saveQueueItem(OfflineQueueItem item) async {
    try {
      await isar.writeTxn(() async {
        await isar.offlineQueueItems.put(item);
      });
    } catch (e) {
      throw Exception('خطا در ذخیره آیتم صف: $e');
    }
  }

  Future<void> deleteQueueItem(int id) async {
    try {
      await isar.writeTxn(() async {
        await isar.offlineQueueItems.delete(id);
      });
    } catch (e) {
      throw Exception('خطا در حذف آیتم صف: $e');
    }
  }

  // ignore: unused_element
  Future<void> _cacheSearchResult(String query, List<Athlete> result) async {
    // اینجا می‌تونی یه جدول کش جدا بسازی، فعلاً ساده رد می‌شه
  }
}
