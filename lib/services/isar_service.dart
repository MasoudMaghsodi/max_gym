import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/athlete_model.dart';
import '../data/models/workout_model.dart';

/// مدیریت پایگاه داده محلی با Isar
class IsarService {
  static late Isar isar;

  static Future<Isar> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [AthleteSchema, WorkoutPlanSchema],
        directory: dir.path,
        inspector: true,
      );
      debugPrint('✅ Isar Database Initialized!');
      return isar; // برگردوندن Isar
    } catch (e, stackTrace) {
      debugPrint('❌ خطا در مقداردهی Isar: $e');
      debugPrint(stackTrace.toString());
      throw Exception('خطا در راه‌اندازی پایگاه داده!');
    }
  }
}
