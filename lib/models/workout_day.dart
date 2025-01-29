import 'exercise_category.dart';
import 'workout_exercise.dart';

class WorkoutDay {
  // نام روز تمرین
  String dayName;
  // لیست دسته‌بندی‌های تمرینات
  List<ExerciseCategory> categories;
  // لیست تمرینات
  List<WorkoutExercise> exercises;
  // وضعیت روز استراحت
  bool isRestDay;

  // سازنده کلاس برای مقداردهی اولیه روز تمرین
  WorkoutDay({
    required this.dayName,
    required this.categories,
    required this.exercises,
    this.isRestDay = false,
  });
}
