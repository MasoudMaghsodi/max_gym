import 'package:isar/isar.dart';
import 'package:max_gym/model/muscle_teq_model/muscle_group_model.dart';
import '../../model/exerciseModel/exercise_model.dart';

class ExerciseController {
  final Isar isar;

  ExerciseController(this.isar);

  // دریافت تمرین‌ها بر اساس شناسه گروه عضلانی
  Future<List<Exercise>> getExercisesByMuscle(int muscleGroupId) async {
    // استفاده از query مستقیم برای فیلتر کردن داده‌ها
    return await isar.exercises
        .filter()
        .muscleGroup((q) => q.idEqualTo(muscleGroupId))
        .findAll();
  }
}
