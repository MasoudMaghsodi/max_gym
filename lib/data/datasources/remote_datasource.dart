import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/data/models/exercise_model.dart' as exercise_model;
import 'package:max_gym/data/models/technique_model.dart';

class RemoteDataSource {
  final SupabaseClient supabase;

  RemoteDataSource(this.supabase);

  // Athlete Methods
  Future<List<Athlete>> getAllAthletes() async {
    try {
      final response = await supabase.from('athletes').select('*');
      return _parseListResponse<Athlete>(response, Athlete.fromJson);
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت ورزشکاران: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> saveAthlete(Athlete athlete) async {
    try {
      await supabase.from('athletes').upsert(athlete.toJson());
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره ورزشکار: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> saveAthletes(List<Athlete> athletes) async {
    try {
      final athletesMap = athletes.map((a) => a.toJson()).toList();
      await supabase.from('athletes').upsert(athletesMap);
    } catch (e, stackTrace) {
      throw Exception(
          'خطا در ذخیره گروهی ورزشکاران: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> deleteAthlete(int id) async {
    try {
      await supabase.from('athletes').delete().eq('id', id);
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف ورزشکار: ${e.toString()}\n$stackTrace');
    }
  }

  // Workout Methods
  Future<List<WorkoutPlan>> getWorkoutPlansByAthleteId(int athleteId) async {
    try {
      final response = await supabase
          .from('workout_plans')
          .select('*')
          .eq('athlete_id', athleteId);
      return _parseListResponse<WorkoutPlan>(response, WorkoutPlan.fromJson);
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت برنامه‌ها: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> saveWorkoutPlan(WorkoutPlan workoutPlan) async {
    try {
      await supabase.from('workout_plans').upsert(workoutPlan.toJson());
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره برنامه: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> saveWorkoutPlans(List<WorkoutPlan> workouts) async {
    try {
      final workoutsMap = workouts.map((w) => w.toJson()).toList();
      await supabase.from('workout_plans').upsert(workoutsMap);
    } catch (e, stackTrace) {
      throw Exception(
          'خطا در ذخیره گروهی برنامه‌ها: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> deleteWorkoutPlan(int id) async {
    try {
      await supabase.from('workout_plans').delete().eq('id', id);
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف برنامه: ${e.toString()}\n$stackTrace');
    }
  }

  // Exercise Methods
  Future<List<exercise_model.Exercise>> getAllExercises() async {
    try {
      final response = await supabase.from('exercises').select('*');
      return _parseListResponse<exercise_model.Exercise>(
          response, exercise_model.Exercise.fromJson);
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت تمرینات: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> saveExercise(exercise_model.Exercise exercise) async {
    try {
      await supabase.from('exercises').upsert(exercise.toJson());
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره تمرین: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> deleteExercise(int id) async {
    try {
      await supabase.from('exercises').delete().eq('id', id);
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف تمرین: ${e.toString()}\n$stackTrace');
    }
  }

  // Technique Methods
  Future<List<Technique>> getAllTechniques() async {
    try {
      final response = await supabase.from('techniques').select('*');
      return _parseListResponse<Technique>(response, Technique.fromJson);
    } catch (e, stackTrace) {
      throw Exception('خطا در دریافت تکنیک‌ها: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> saveTechnique(Technique technique) async {
    try {
      await supabase.from('techniques').upsert(technique.toJson());
    } catch (e, stackTrace) {
      throw Exception('خطا در ذخیره تکنیک: ${e.toString()}\n$stackTrace');
    }
  }

  Future<void> deleteTechnique(int id) async {
    try {
      await supabase.from('techniques').delete().eq('id', id);
    } catch (e, stackTrace) {
      throw Exception('خطا در حذف تکنیک: ${e.toString()}\n$stackTrace');
    }
  }

  List<T> _parseListResponse<T>(
    dynamic response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (response is List) {
      return response.map((e) => fromJson(e)).toList();
    } else {
      throw Exception('فرمت پاسخ سرور نامعتبر است!');
    }
  }
}
