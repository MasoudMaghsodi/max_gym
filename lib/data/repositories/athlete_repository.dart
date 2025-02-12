import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/connectivity_service.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/athlete_model.dart';

class AthleteRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;
  final ConnectivityService _connectivityService;

  AthleteRepository({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
    required ConnectivityService connectivityService,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource,
        _connectivityService = connectivityService;

  /// دریافت تمام ورزشکاران با اولویت داده‌های ابری
  Future<AsyncValue<List<Athlete>>> getAllAthletes() async {
    try {
      final remoteAthletes = await _remoteDataSource.getAllAthletes();
      await _localDataSource
          .saveAthletes(remoteAthletes); // استفاده از متد گروهی
      return AsyncValue.data(remoteAthletes);
    } catch (e, stackTrace) {
      // 3. فال‌بک به داده‌های محلی
      try {
        final localAthletes = await _localDataSource.getAllAthletes();
        return AsyncValue.data(localAthletes);
      } catch (localError) {
        return AsyncValue.error('خطا در دریافت داده‌ها', stackTrace);
      }
    }
  }

  /// ذخیره ورزشکار در هر دو منبع
  Future<void> saveAthlete(Athlete athlete) async {
    try {
      // اول توی ایسار ذخیره کن
      await _localDataSource.saveAthlete(athlete);

      // اگر نت وصل بود، توی سوپابیس هم ذخیره کن
      final isConnected = await _connectivityService.isConnected();
      if (isConnected) {
        await _remoteDataSource.saveAthlete(athlete);
        await _localDataSource.markAthleteAsSynced(athlete.id);
      }
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره ورزشکار: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> syncDataToSupabase() async {
    try {
      // گرفتن ورزشکارهایی که هنوز به سوپابیس ارسال نشدن
      final unsyncedAthletes = await _localDataSource.getUnsyncedAthletes();

      // ارسال به سوپابیس
      for (final athlete in unsyncedAthletes) {
        await _remoteDataSource.saveAthlete(athlete);
        await _localDataSource.markAthleteAsSynced(athlete.id);
      }
    } catch (e, stackTrace) {
      throw Exception('خطا در سینک داده‌ها: ${e.toString()}\n$stackTrace');
    }
  }

  /// حذف ورزشکار از هر دو منبع
  Future<void> deleteAthlete(int id) async {
    try {
      await Future.wait([
        _remoteDataSource.deleteAthlete(id),
        _localDataSource.deleteAthlete(id),
      ]);
      // ignore: unused_catch_stack
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف ورزشکار: ${e.toString()}');
    }
  }
}
