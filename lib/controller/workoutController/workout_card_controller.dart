import 'package:isar/isar.dart';
import '../../model/workoutModel/workout_card_model.dart';

class WorkoutCardController {
  final Isar isar;

  WorkoutCardController(this.isar);

  // ذخیره Workout جدید
  Future<void> saveWorkout(WorkoutCard workout) async {
    await isar.writeTxn(() => isar.workoutCards.put(workout));
  }

  // دریافت تمام Workoutها
  Future<List<WorkoutCard>> getAllWorkouts() async {
    return await isar.workoutCards.where().findAll();
  }

  // حذف Workout
  Future<void> deleteWorkout(Id id) async {
    await isar.writeTxn(() => isar.workoutCards.delete(id));
  }

  // به‌روزرسانی Workout
  Future<void> updateWorkout(WorkoutCard workout) async {
    await isar.writeTxn(() => isar.workoutCards.put(workout));
  }
}
