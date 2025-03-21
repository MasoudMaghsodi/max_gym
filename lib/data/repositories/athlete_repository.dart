import 'dart:convert';
import 'package:max_gym/data/datasources/local_datasource.dart';
import 'package:max_gym/data/datasources/remote_datasource.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/offline_queue.dart';
import 'package:max_gym/services/notification_service.dart';

class AthleteRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  AthleteRepository(this._localDataSource, this._remoteDataSource);

  Future<List<Athlete>> getAllAthletes() async {
    try {
      final remoteAthletes = await _remoteDataSource.getAllAthletes();
      await _localDataSource.saveAthletes(remoteAthletes);
      return remoteAthletes;
    } catch (e) {
      return await _localDataSource.getAllAthletes();
    }
  }

  Future<List<Athlete>> searchAthletes(String query,
      {List<String>? filters}) async {
    try {
      return await _localDataSource.searchAthletes(query, filters: filters);
    } catch (e) {
      return await _localDataSource.getAllAthletes();
    }
  }

  Future<void> saveAthlete(Athlete athlete) async {
    try {
      athlete.lastModified = DateTime.now();
      await _localDataSource.saveAthlete(athlete);
      if (await _isOnline()) {
        await _retryOperation(() => _remoteDataSource.saveAthlete(athlete));
        await _localDataSource.markAthleteAsSynced(athlete.id);
      } else {
        await _addToQueue('save_athlete', jsonEncode(athlete.toJson()));
      }
    } catch (e) {
      throw Exception('خطا در ذخیره ورزشکار: $e');
    }
  }

  Future<void> deleteAthlete(int id) async {
    try {
      await _localDataSource.deleteAthlete(id);
      if (await _isOnline()) {
        await _retryOperation(() => _remoteDataSource.deleteAthlete(id));
      } else {
        await _addToQueue('delete_athlete', jsonEncode({'id': id.toString()}));
      }
    } catch (e) {
      throw Exception('خطا در حذف ورزشکار: $e');
    }
  }

  Future<void> syncAll() async {
    try {
      final unsyncedAthletes = await _localDataSource.getUnsyncedAthletes();
      for (final athlete in unsyncedAthletes) {
        await _retryOperation(() => _remoteDataSource.saveAthlete(athlete));
        await _localDataSource.markAthleteAsSynced(athlete.id);
      }
      await _processQueue();
      await NotificationService.showNotification(
        id: 0,
        title: 'سینک موفق',
        body: 'داده‌ها با موفقیت سینک شدند!',
      );
    } catch (e) {
      await NotificationService.showNotification(
        id: 1,
        title: 'خطا در سینک',
        body: 'مشکلی در سینک داده‌ها پیش اومد: $e',
      );
      throw Exception('خطا در سینک: $e');
    }
  }

  Future<void> _addToQueue(String action, String data) async {
    final queueItem = OfflineQueueItem(
      action: action,
      data: data,
      timestamp: DateTime.now(),
    );
    await _localDataSource.saveQueueItem(queueItem);
  }

  Future<void> _processQueue() async {
    final queueItems = await _localDataSource.getQueueItems();
    for (final item in queueItems) {
      try {
        final data = item.getData();
        switch (item.action) {
          case 'save_athlete':
            final athlete = Athlete.fromJson(data);
            await _remoteDataSource.saveAthlete(athlete);
            await _localDataSource.markAthleteAsSynced(athlete.id);
            break;
          case 'delete_athlete':
            final id = int.parse(data['id'].toString());
            await _remoteDataSource.deleteAthlete(id);
            break;
        }
        await _localDataSource.deleteQueueItem(item.id);
      } catch (e) {
        // خطا رو لاگ کن ولی ادامه بده
      }
    }
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
