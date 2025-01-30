import 'workout_exercise.dart';
import 'exercise_category.dart';

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

  // تابع copyWith برای کپی کردن و به‌روزرسانی خصوصیات
  WorkoutDay copyWith({
    String? dayName,
    List<ExerciseCategory>? categories,
    List<WorkoutExercise>? exercises,
    bool? isRestDay,
  }) {
    return WorkoutDay(
      dayName: dayName ?? this.dayName,
      categories: categories ?? this.categories,
      exercises: exercises ?? this.exercises,
      isRestDay: isRestDay ?? this.isRestDay,
    );
  }
}
