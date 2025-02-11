import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/athlete_model.dart';
import '../data/models/workout_model.dart';

/// مدیریت پایگاه داده محلی با Isar
class IsarService {
  static late Isar isar;

  /// مقداردهی اولیه پایگاه داده
  static Future<void> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [AthleteSchema, WorkoutPlanSchema],
        directory: dir.path,
        inspector: true, // فعالسازی Inspector فقط برای محیط توسعه
      );
      debugPrint('✅ Isar Database Initialized!');
    } catch (e, stackTrace) {
      debugPrint('❌ خطا در مقداردهی Isar: $e');
      debugPrint(stackTrace.toString());
      throw Exception('خطا در راه‌اندازی پایگاه داده!');
    }
  }
}
