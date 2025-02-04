import 'package:isar/isar.dart';
import '../exerciseModel/exercise_model.dart';
part 'muscle_group_model.g.dart';

// مدل اصلی گروه عضلانی
@Collection()
class MuscleGroup {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String name; // نام گروه عضلانی (مثال: سینه)

  @Backlink(to: 'muscleGroup')
  final exercises = IsarLinks<Exercise>(); // حرکات مرتبط

  // CopyWith Method for Immutability
  MuscleGroup copyWith({
    Id? id,
    String? name,
  }) {
    return MuscleGroup()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }

  @override
  String toString() {
    return '''
MuscleGroup:
  id: $id
  name: $name
  exercises: ${exercises.map((e) => e.name).join(', ') ?? 'No Exercises'}
''';
  }
}
