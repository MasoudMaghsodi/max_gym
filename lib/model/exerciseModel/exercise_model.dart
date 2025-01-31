import 'package:isar/isar.dart';
import '../muscle_teq_model/muscle_group_model.dart';
part 'exercise_model.g.dart';

@Collection()
class Exercise {
  Id id = Isar.autoIncrement;
  late String name;
  final muscleGroup = IsarLink<MuscleGroup>(); // استفاده از IsarLink
}
