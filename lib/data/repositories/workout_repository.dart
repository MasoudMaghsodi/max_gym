import 'dart:convert';
import 'package:max_gym/data/datasources/local_datasource.dart';
import 'package:max_gym/data/datasources/remote_datasource.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/data/models/exercise_model.dart';
import 'package:max_gym/data/models/technique_model.dart';
import 'package:max_gym/data/models/offline_queue.dart';
import 'package:max_gym/services/notification_service.dart';

class WorkoutRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  WorkoutRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<List<WorkoutPlan>> getWorkoutPlansByAthleteId(int athleteId) async {
    try {
      final remotePlans =
          await remoteDataSource.getWorkoutPlansByAthleteId(athleteId);
      await localDataSource.saveWorkoutPlans(remotePlans);
      return remotePlans;
    } catch (e) {
      return await localDataSource.getWorkoutPlansByAthleteId(athleteId);
    }
  }

  Future<void> saveWorkoutPlan(WorkoutPlan workoutPlan) async {
    try {
      workoutPlan.lastModified = DateTime.now();
      await localDataSource.saveWorkoutPlan(workoutPlan);
      if (await _isOnline()) {
        await _retryOperation(
            () => remoteDataSource.saveWorkoutPlan(workoutPlan));
      } else {
        await _addToQueue('save_workout', jsonEncode(workoutPlan.toJson()));
      }
    } catch (e) {
      throw Exception('خطا در ذخیره برنامه تمرینی: $e');
    }
  }

  Future<void> deleteWorkoutPlan(int id) async {
    try {
      await localDataSource.deleteWorkoutPlan(id);
      if (await _isOnline()) {
        await _retryOperation(() => remoteDataSource.deleteWorkoutPlan(id));
      } else {
        await _addToQueue('delete_workout', jsonEncode({'id': id.toString()}));
      }
    } catch (e) {
      throw Exception('خطا در حذف برنامه تمرینی: $e');
    }
  }

  Future<List<Exercise>> getAllExercises() async {
    try {
      final remoteExercises = await remoteDataSource.getAllExercises();
      await localDataSource.saveExercises(remoteExercises);
      return remoteExercises;
    } catch (e) {
      return await localDataSource.getAllExercises();
    }
  }

  Future<void> saveExercise(Exercise exercise) async {
    try {
      await localDataSource.saveExercise(exercise);
      if (await _isOnline()) {
        await _retryOperation(() => remoteDataSource.saveExercise(exercise));
      } else {
        await _addToQueue('save_exercise', jsonEncode(exercise.toJson()));
      }
    } catch (e) {
      throw Exception('خطا در ذخیره تمرین: $e');
    }
  }

  Future<void> deleteExercise(int id) async {
    try {
      await localDataSource.deleteExercise(id);
      if (await _isOnline()) {
        await _retryOperation(() => remoteDataSource.deleteExercise(id));
      } else {
        await _addToQueue('delete_exercise', jsonEncode({'id': id.toString()}));
      }
    } catch (e) {
      throw Exception('خطا در حذف تمرین: $e');
    }
  }

  Future<List<Technique>> getAllTechniques() async {
    try {
      final remoteTechniques = await remoteDataSource.getAllTechniques();
      await localDataSource.saveTechniques(remoteTechniques);
      return remoteTechniques;
    } catch (e) {
      return await localDataSource.getAllTechniques();
    }
  }

  Future<void> saveTechnique(Technique technique) async {
    try {
      await localDataSource.saveTechnique(technique);
      if (await _isOnline()) {
        await _retryOperation(() => remoteDataSource.saveTechnique(technique));
      } else {
        await _addToQueue('save_technique', jsonEncode(technique.toJson()));
      }
    } catch (e) {
      throw Exception('خطا در ذخیره تکنیک: $e');
    }
  }

  Future<void> deleteTechnique(int id) async {
    try {
      await localDataSource.deleteTechnique(id);
      if (await _isOnline()) {
        await _retryOperation(() => remoteDataSource.deleteTechnique(id));
      } else {
        await _addToQueue(
            'delete_technique', jsonEncode({'id': id.toString()}));
      }
    } catch (e) {
      throw Exception('خطا در حذف تکنیک: $e');
    }
  }

  Future<void> _addToQueue(String action, String data) async {
    final queueItem = OfflineQueueItem(
      action: action,
      data: data,
      timestamp: DateTime.now(),
    );
    await localDataSource.saveQueueItem(queueItem);
  }

  // ignore: unused_element
  Future<void> _processQueue() async {
    final queueItems = await localDataSource.getQueueItems();
    for (final item in queueItems) {
      try {
        final data = item.getData();
        switch (item.action) {
          case 'save_workout':
            final workout = WorkoutPlan.fromJson(data);
            await remoteDataSource.saveWorkoutPlan(workout);
            break;
          case 'delete_workout':
            final id = int.parse(data['id'].toString());
            await remoteDataSource.deleteWorkoutPlan(id);
            break;
          case 'save_exercise':
            final exercise = Exercise.fromJson(data);
            await remoteDataSource.saveExercise(exercise);
            break;
          case 'delete_exercise':
            final id = int.parse(data['id'].toString());
            await remoteDataSource.deleteExercise(id);
            break;
          case 'save_technique':
            final technique = Technique.fromJson(data);
            await remoteDataSource.saveTechnique(technique);
            break;
          case 'delete_technique':
            final id = int.parse(data['id'].toString());
            await remoteDataSource.deleteTechnique(id);
            break;
        }
        await localDataSource.deleteQueueItem(item.id);
      } catch (e) {
        // خطا رو لاگ کن ولی ادامه بده
      }
    }
    await NotificationService.showNotification(
      id: 2,
      title: 'سینک صف',
      body: 'عملیات آفلاین با موفقیت سینک شدند!',
    );
  }

  Future<bool> _isOnline() async {
    return true; // موقتاً همیشه آنلاین
  }

  Future<void> _retryOperation(Future<void> Function() operation) async {
    const maxAttempts = 3;
    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        await operation();
        return;
      } catch (e) {
        if (attempt == maxAttempts) rethrow;
        await Future.delayed(Duration(seconds: 2 * attempt));
      }
    }
  }
}

extension on LocalDataSource {
  Future<void> saveExercises(List<Exercise> exercises) async {
    await isar.writeTxn(() async {
      await isar.collection<Exercise>().putAll(exercises);
    });
  }

  Future<void> saveTechniques(List<Technique> techniques) async {
    await isar.writeTxn(() async {
      await isar.techniques.putAll(techniques);
    });
  }
}
