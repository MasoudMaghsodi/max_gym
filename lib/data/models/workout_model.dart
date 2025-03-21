import 'package:isar/isar.dart';
part 'workout_model.g.dart';

@Collection()
class WorkoutPlan {
  Id id = Isar.autoIncrement;

  int? athleteId;
  int dayOfWeek;
  String type;
  List<String> targetMuscles;
  List<int> exerciseIds; // به جای لیست Exercise، IDها رو ذخیره می‌کنیم
  DateTime? lastModified;

  WorkoutPlan({
    this.athleteId,
    required this.dayOfWeek,
    required this.type,
    required this.targetMuscles,
    required this.exerciseIds,
    this.lastModified,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'athlete_id': athleteId,
      'dayOfWeek': dayOfWeek,
      'type': type,
      'targetMuscles': targetMuscles,
      'exerciseIds': exerciseIds,
      'lastModified': lastModified?.toIso8601String(),
    };
  }

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      athleteId: json['athlete_id'],
      dayOfWeek: json['dayOfWeek'] ?? 0,
      type: json['type'] ?? '',
      targetMuscles:
          (json['targetMuscles'] as List<dynamic>?)?.cast<String>() ?? [],
      exerciseIds: (json['exerciseIds'] as List<dynamic>?)?.cast<int>() ?? [],
      lastModified: json['lastModified'] != null
          ? DateTime.parse(json['lastModified'])
          : null,
    )..id = json['id'] ?? Isar.autoIncrement;
  }
}
