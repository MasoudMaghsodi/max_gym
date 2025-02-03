import 'package:isar/isar.dart';
import '../exerciseModel/exercise_model.dart';
part 'muscle_group_model.g.dart';

// مدل اصلی گروه عضلانی
@Collection()
class MuscleGroup {
  Id id = Isar.autoIncrement;

  @Index()
  late String name; // نام گروه عضلانی (مثال: سینه)

  @Backlink(to: 'muscleGroup')
  final exercises = IsarLinks<Exercise>(); // حرکات مرتبط
}
