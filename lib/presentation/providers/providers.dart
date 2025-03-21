import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/data/datasources/local_datasource.dart';
import 'package:max_gym/data/datasources/remote_datasource.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/data/models/offline_queue.dart';
import 'package:max_gym/data/repositories/athlete_repository.dart';
import 'package:max_gym/data/repositories/workout_repository.dart';
import 'package:max_gym/services/isar_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final databaseProvider = Provider<Isar>((ref) => IsarService.isar);

final athleteRepositoryProvider = Provider<AthleteRepository>((ref) {
  final localDataSource = LocalDataSource(ref.read(databaseProvider));
  final remoteDataSource = RemoteDataSource(Supabase.instance.client);
  return AthleteRepository(localDataSource, remoteDataSource);
});

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) {
  final localDataSource = LocalDataSource(ref.read(databaseProvider));
  final remoteDataSource = RemoteDataSource(Supabase.instance.client);
  return WorkoutRepository(
      localDataSource: localDataSource, remoteDataSource: remoteDataSource);
});

final athletesProvider = FutureProvider<List<Athlete>>((ref) async {
  final repo = ref.watch(athleteRepositoryProvider);
  return await repo.getAllAthletes();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredAthletesProvider = FutureProvider<List<Athlete>>((ref) async {
  final repo = ref.watch(athleteRepositoryProvider);
  final query = ref.watch(searchQueryProvider);
  final filters = ref.watch(filterProvider);
  return await repo.searchAthletes(query, filters: filters);
});

final workoutPlansProvider =
    FutureProvider.family<List<WorkoutPlan>, int>((ref, athleteId) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return await repo.getWorkoutPlansByAthleteId(athleteId);
});

final filterProvider = StateProvider<List<String>>((ref) => []);

final offlineQueueProvider =
    FutureProvider<List<OfflineQueueItem>>((ref) async {
  final localDataSource = LocalDataSource(ref.read(databaseProvider));
  return await localDataSource.getQueueItems();
});
