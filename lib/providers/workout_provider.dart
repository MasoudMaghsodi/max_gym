import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/workout_day.dart';
import '../models/workout_exercise.dart';

final workoutProvider =
    StateNotifierProvider<WorkoutNotifier, List<WorkoutDay>>((ref) {
  return WorkoutNotifier();
});

class WorkoutNotifier extends StateNotifier<List<WorkoutDay>> {
  WorkoutNotifier() : super([]);

  void setWorkouts(List<WorkoutDay> workouts) {
    state = workouts;
  }

  void addWorkout(WorkoutDay workout) {
    state = [...state, workout];
  }

  void removeWorkout(String dayName) {
    state = state.where((workout) => workout.dayName != dayName).toList();
  }

  void updateWorkout(WorkoutDay updatedWorkout) {
    state = [
      for (final workout in state)
        if (workout.dayName == updatedWorkout.dayName)
          updatedWorkout
        else
          workout,
    ];
  }

  // تابع برای دریافت تمرین روز مشخص شده
  WorkoutDay getWorkoutDay(String dayName) {
    return state.firstWhere(
      (workout) => workout.dayName == dayName,
      orElse: () => WorkoutDay(
        dayName: dayName,
        categories: [],
        exercises: [],
        isRestDay: false,
      ),
    );
  }

  // تابع برای به‌روزرسانی تمرین روز مشخص شده
  void updateWorkoutExercise(String dayName, List<WorkoutExercise> exercises) {
    final workoutDay = getWorkoutDay(dayName);
    final updatedWorkoutDay = workoutDay.copyWith(exercises: exercises);
    updateWorkout(updatedWorkoutDay);
  }
}
