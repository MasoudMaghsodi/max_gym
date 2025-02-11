import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/models/athlete_model.dart';
import '../../data/models/workout_model.dart';

/// مدیریت داده‌های ابری با استفاده از Supabase (نسخه بهینه‌شده)
class RemoteDataSource {
  final SupabaseClient supabase;

  RemoteDataSource(this.supabase);

  // #######################################################
  // ورزشکاران
  // #######################################################

  /// دریافت همه ورزشکاران
  Future<List<Athlete>> getAllAthletes() async {
    try {
      final response = await supabase.from('athletes').select('*');
      return _parseListResponse<Athlete>(response, Athlete.fromMap);
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت ورزشکاران: ${e.toString()}\n$stackTrace');
    }
  }

  /// ذخیره یا به‌روزرسانی تک ورزشکار
  Future<void> saveAthlete(Athlete athlete) async {
    try {
      await supabase.from('athletes').upsert(athlete.toMap());
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره ورزشکار: ${e.toString()}\n$stackTrace');
    }
  }

  /// ذخیره یا به‌روزرسانی گروهی ورزشکاران
  Future<void> saveAthletes(List<Athlete> athletes) async {
    try {
      final athletesMap = athletes.map((a) => a.toMap()).toList();
      await supabase.from('athletes').upsert(athletesMap);
    } catch (e, stackTrace) {
      throw Exception(
          'خطا در ذخیره گروهی ورزشکاران: ${e.toString()}\n$stackTrace');
    }
  }

  /// حذف ورزشکار
  Future<void> deleteAthlete(int id) async {
    try {
      await supabase.from('athletes').delete().eq('id', id);
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف ورزشکار: ${e.toString()}\n$stackTrace');
    }
  }

  // #######################################################
  // برنامه‌های تمرینی
  // #######################################################

  /// دریافت برنامه‌های تمرینی یک ورزشکار
  Future<List<WorkoutPlan>> getWorkoutPlansByAthleteId(int athleteId) async {
    try {
      final response = await supabase
          .from('workout_plans')
          .select('*')
          .eq('athlete_id', athleteId);
      return _parseListResponse<WorkoutPlan>(response, WorkoutPlan.fromMap);
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت برنامه‌ها: ${e.toString()}\n$stackTrace');
    }
  }

  /// ذخیره یا به‌روزرسانی تک برنامه تمرینی
  Future<void> saveWorkoutPlan(WorkoutPlan workoutPlan) async {
    try {
      await supabase.from('workout_plans').upsert(workoutPlan.toMap());
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره برنامه: ${e.toString()}\n$stackTrace');
    }
  }

  /// ذخیره یا به‌روزرسانی گروهی برنامه‌های تمرینی
  Future<void> saveWorkoutPlans(List<WorkoutPlan> workouts) async {
    try {
      final workoutsMap = workouts.map((w) => w.toMap()).toList();
      await supabase.from('workout_plans').upsert(workoutsMap);
    } catch (e, stackTrace) {
      throw Exception(
          'خطا در ذخیره گروهی برنامه‌ها: ${e.toString()}\n$stackTrace');
    }
  }

  /// حذف برنامه تمرینی
  Future<void> deleteWorkoutPlan(int id) async {
    try {
      await supabase.from('workout_plans').delete().eq('id', id);
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف برنامه: ${e.toString()}\n$stackTrace');
    }
  }

  // #######################################################
  // توابع کمکی
  // #######################################################

  /// تبدیل پاسخ Supabase به لیست مدل‌ها
  List<T> _parseListResponse<T>(
    dynamic response,
    T Function(Map<String, dynamic>) fromMap,
  ) {
    if (response is List) {
      return response.map((e) => fromMap(e)).toList();
    } else {
      throw Exception('فرمت پاسخ سرور نامعتبر است!');
    }
  }
}
