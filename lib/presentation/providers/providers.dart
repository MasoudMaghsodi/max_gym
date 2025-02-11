import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/isar_service.dart';
import '../../data/datasources/local_datasource.dart';
import '../../data/datasources/remote_datasource.dart';
import '../../data/models/athlete_model.dart';
import '../../data/models/workout_model.dart';
import '../../data/repositories/athlete_repository.dart';
import '../../data/repositories/workout_repository.dart';

// ##########################################################
// Providers اصلی
// ##########################################################

/// ارائه دهنده کلاینت Supabase
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// ارائه دهنده پایگاه داده Isar (مقداردهی اولیه شده)
final isarProvider = FutureProvider<Isar>((ref) async {
  await IsarService.init(); // فقط یک بار اجرا می‌شود
  return IsarService.isar;
});

// ##########################################################
// Providers منابع داده
// ##########################################################

/// ارائه دهنده منبع داده محلی (Isar)
final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  final isar = ref
      .watch(isarProvider)
      .requireValue; // استفاده از requireValue برای جلوگیری از null
  return LocalDataSource(isar);
});

/// ارائه دهنده منبع داده ابری (Supabase)
final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return RemoteDataSource(supabase);
});

// ##########################################################
// Providers مخازن داده
// ##########################################################

/// ارائه دهنده مخزن ورزشکاران
final athleteRepositoryProvider = Provider<AthleteRepository>((ref) {
  return AthleteRepository(
    localDataSource: ref.watch(localDataSourceProvider),
    remoteDataSource: ref.watch(remoteDataSourceProvider),
  );
});

/// ارائه دهنده مخزن برنامه‌های تمرینی
final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) {
  return WorkoutRepository(
    localDataSource: ref.watch(localDataSourceProvider),
    remoteDataSource: ref.watch(remoteDataSourceProvider),
  );
});
// پرووایدر برنامه‌های تمرینی یک ورزشکار خاص
final workoutPlansProvider = FutureProvider.family<List<WorkoutPlan>, int>(
  (ref, athleteId) async {
    final repository = ref.watch(workoutRepositoryProvider);
    final result = await repository.getWorkoutPlansByAthleteId(athleteId);

    return result.when(
      data: (workoutPlans) => workoutPlans,
      error: (error, _) => throw error,
      loading: () => throw Exception('در حال بارگذاری...'),
    );
  },
);

// ##########################################################
// Providers داده‌های برنامه
// ##########################################################

/// ارائه دهنده لیست ورزشکاران (با مدیریت حالت‌های AsyncValue)
final athletesProvider = FutureProvider.autoDispose<List<Athlete>>((ref) async {
  final repository = ref.watch(athleteRepositoryProvider);
  final result = await repository.getAllAthletes();

  return result.when(
    data: (athletes) => athletes,
    error: (error, _) => throw error,
    loading: () => throw Exception('در حال بارگذاری...'),
  );
});
