import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/data/models/offline_queue.dart';
import 'package:path_provider/path_provider.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/data/models/exercise_model.dart';
import 'package:max_gym/data/models/technique_model.dart';

class IsarService {
  static late Isar isar;

  static Future<Isar> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [
          AthleteSchema,
          WorkoutPlanSchema,
          ExerciseSchema,
          TechniqueSchema,
          OfflineQueueItemSchema
        ],
        directory: dir.path,
        inspector: true,
      );
      await _preloadData();
      debugPrint('✅ Isar Database Initialized!');
      return isar;
    } catch (e, stackTrace) {
      debugPrint('❌ خطا در مقداردهی Isar: $e');
      debugPrint(stackTrace.toString());
      throw Exception('خطا در راه‌اندازی پایگاه داده!');
    }
  }

  static Future<void> _preloadData() async {
    try {
      await isar.athletes.where().limit(20).findAll();
      await isar.exercises.where().limit(50).findAll();
      await isar.techniques.where().limit(50).findAll();
      debugPrint('✅ Preloaded athletes, exercises, and techniques');
    } catch (e) {
      debugPrint('خطا در پیش‌لود داده‌ها: $e');
    }
  }

  Future<void> clearCache() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
