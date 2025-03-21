import 'package:isar/isar.dart';
part 'exercise_model.g.dart';

@Collection()
class Exercise {
  Id id = Isar.autoIncrement;

  String name;
  String tool;
  String technique;
  int sets;
  int reps;
  String note;

  Exercise({
    this.name = '',
    this.tool = '',
    this.technique = '',
    this.sets = 0,
    this.reps = 0,
    this.note = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tool': tool,
      'technique': technique,
      'sets': sets,
      'reps': reps,
      'note': note,
    };
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'] ?? '',
      tool: json['tool'] ?? '',
      technique: json['technique'] ?? '',
      sets: json['sets'] ?? 0,
      reps: json['reps'] ?? 0,
      note: json['note'] ?? '',
    )..id = json['id'] ?? Isar.autoIncrement;
  }
}
