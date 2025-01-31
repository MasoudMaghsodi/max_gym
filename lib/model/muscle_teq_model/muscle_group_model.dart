import 'package:isar/isar.dart';
part 'muscle_group_model.g.dart';

@Collection()
class MuscleGroup {
  Id id = Isar.autoIncrement;
  late String name;
}
