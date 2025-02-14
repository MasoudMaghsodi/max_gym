import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:path_provider/path_provider.dart';

class BackupService {
  final Isar isar;

  BackupService({required this.isar});

  /// اکسپورت داده‌ها به فایل JSON
  Future<void> exportToJson(BuildContext context) async {
    final athletes = await isar.athletes.where().findAll();
    final workouts = await isar.workoutPlans.where().findAll();

    final data = {
      'athletes': athletes.map((a) => a.toMap()).toList(),
      'workouts': workouts.map((w) => w.toMap()).toList(),
    };

    final jsonString = jsonEncode(data);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/backup.json');

    await file.writeAsString(jsonString);

    // استفاده از BuildContext صحیح
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('بکاپ با موفقیت ذخیره شد: ${file.path}')),
    );
  }

  /// ایمپورت داده‌ها از فایل JSON
  Future<void> importFromJson(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/backup.json');

    if (!await file.exists()) {
      throw Exception('فایل بکاپ یافت نشد!');
    }

    final jsonString = await file.readAsString();
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    final athletes =
        (data['athletes'] as List).map((a) => Athlete.fromMap(a)).toList();
    final workouts =
        (data['workouts'] as List).map((w) => WorkoutPlan.fromMap(w)).toList();

    await isar.writeTxn(() async {
      await isar.athletes.putAll(athletes);
      await isar.workoutPlans.putAll(workouts);
    });

    // استفاده از BuildContext صحیح
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('داده‌ها با موفقیت بازیابی شدند')),
    );
  }
}
