import 'package:isar/isar.dart';

part 'exercises.g.dart';

@Collection()
class Exercise {
  Id id = Isar.autoIncrement;

  late String name;
  late String tool; // dumbbell, barbell, machine, bodyweight
  late List<String> targetMuscles;

  Exercise({
    required this.name,
    required this.tool,
    required this.targetMuscles,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tool': tool,
      'target_muscles': targetMuscles.join(','),
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      name: map['name'],
      tool: map['tool'],
      targetMuscles: (map['target_muscles'] as String?)?.split(',') ?? [],
    )..id = map['id'];
  }
}
