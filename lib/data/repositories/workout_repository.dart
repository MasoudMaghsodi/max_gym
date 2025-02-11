import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/workout_model.dart';

class WorkoutRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  WorkoutRepository({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  /// دریافت برنامه‌های تمرینی با اولویت داده‌های ابری
  Future<AsyncValue<List<WorkoutPlan>>> getWorkoutPlansByAthleteId(
      int athleteId) async {
    try {
      final remoteWorkouts =
          await _remoteDataSource.getWorkoutPlansByAthleteId(athleteId);
      await _localDataSource
          .saveWorkoutPlans(remoteWorkouts); // استفاده از متد گروهی
      return AsyncValue.data(remoteWorkouts);
    } catch (e, stackTrace) {
      // 3. فال‌بک به داده‌های محلی
      try {
        final localWorkouts =
            await _localDataSource.getWorkoutPlansByAthleteId(athleteId);
        return AsyncValue.data(localWorkouts);
      } catch (localError) {
        return AsyncValue.error('خطا در دریافت برنامه‌ها', stackTrace);
      }
    }
  }

  /// ذخیره برنامه تمرینی در هر دو منبع
  Future<void> saveWorkoutPlan(WorkoutPlan workoutPlan) async {
    try {
      await Future.wait([
        _remoteDataSource.saveWorkoutPlan(workoutPlan),
        _localDataSource.saveWorkoutPlan(workoutPlan), // استفاده از متد تک‌تایی
      ]);
      // ignore: unused_catch_stack
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره برنامه: ${e.toString()}');
    }
  }

  /// حذف برنامه تمرینی از هر دو منبع
  Future<void> deleteWorkoutPlan(int id) async {
    try {
      await Future.wait([
        _remoteDataSource.deleteWorkoutPlan(id),
        _localDataSource.deleteWorkoutPlan(id),
      ]);
      // ignore: unused_catch_stack
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف برنامه: ${e.toString()}');
    }
  }
}
