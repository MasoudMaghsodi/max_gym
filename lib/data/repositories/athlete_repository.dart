import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/athlete_model.dart';

class AthleteRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  AthleteRepository({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

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
      await Future.wait([
        _remoteDataSource.saveAthlete(athlete),
        _localDataSource.saveAthlete(athlete), // استفاده از متد تک‌تایی
      ]);
      // ignore: unused_catch_stack
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره ورزشکار: ${e.toString()}');
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
