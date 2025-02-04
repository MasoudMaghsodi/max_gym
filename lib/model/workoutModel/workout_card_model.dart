import 'package:isar/isar.dart';
part 'workout_card_model.g.dart';

@Collection()
class WorkoutCard {
  Id id = Isar.autoIncrement;

  late int athleteId; // شناسه ورزشکار
  late int muscleGroupId; // شناسه گروه عضلانی
  late int exerciseId; // شناسه تمرین
  late int sets; // تعداد ست‌ها
  late int reps; // تعداد تکرارها

  int? techniqueId; // شناسه تکنیک (اختیاری)
  int? supersetExerciseId; // شناسه تمرین سوپرست (اختیاری)
  int? supersetSets; // تعداد ست‌های سوپرست (اختیاری)
  int? supersetReps; // تعداد تکرارهای سوپرست (اختیاری)
  int? supersetTechniqueId; // شناسه تکنیک سوپرست (اختیاری)

  int? trisetExerciseId; // شناسه تمرین ترای‌ست (اختیاری)
  int? trisetSets; // تعداد ست‌های ترای‌ست (اختیاری)
  int? trisetReps; // تعداد تکرارهای ترای‌ست (اختیاری)
  int? trisetTechniqueId; // شناسه تکنیک ترای‌ست (اختیاری)

  // Constructor
  WorkoutCard({
    this.id = Isar.autoIncrement,
    required this.athleteId,
    required this.muscleGroupId,
    required this.exerciseId,
    required this.sets,
    required this.reps,
    this.techniqueId,
    this.supersetExerciseId,
    this.supersetSets,
    this.supersetReps,
    this.supersetTechniqueId,
    this.trisetExerciseId,
    this.trisetSets,
    this.trisetReps,
    this.trisetTechniqueId,
  });

  // Validation Logic
  bool get isValid {
    return athleteId > 0 &&
        muscleGroupId > 0 &&
        exerciseId > 0 &&
        sets > 0 &&
        reps > 0;
  }

  // CopyWith Method for Immutability
  WorkoutCard copyWith({
    Id? id,
    int? athleteId,
    int? muscleGroupId,
    int? exerciseId,
    int? sets,
    int? reps,
    int? techniqueId,
    int? supersetExerciseId,
    int? supersetSets,
    int? supersetReps,
    int? supersetTechniqueId,
    int? trisetExerciseId,
    int? trisetSets,
    int? trisetReps,
    int? trisetTechniqueId,
  }) {
    return WorkoutCard(
      id: id ?? this.id,
      athleteId: athleteId ?? this.athleteId,
      muscleGroupId: muscleGroupId ?? this.muscleGroupId,
      exerciseId: exerciseId ?? this.exerciseId,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      techniqueId: techniqueId ?? this.techniqueId,
      supersetExerciseId: supersetExerciseId ?? this.supersetExerciseId,
      supersetSets: supersetSets ?? this.supersetSets,
      supersetReps: supersetReps ?? this.supersetReps,
      supersetTechniqueId: supersetTechniqueId ?? this.supersetTechniqueId,
      trisetExerciseId: trisetExerciseId ?? this.trisetExerciseId,
      trisetSets: trisetSets ?? this.trisetSets,
      trisetReps: trisetReps ?? this.trisetReps,
      trisetTechniqueId: trisetTechniqueId ?? this.trisetTechniqueId,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'athleteId': athleteId,
      'muscleGroupId': muscleGroupId,
      'exerciseId': exerciseId,
      'sets': sets,
      'reps': reps,
      'techniqueId': techniqueId,
      'supersetExerciseId': supersetExerciseId,
      'supersetSets': supersetSets,
      'supersetReps': supersetReps,
      'supersetTechniqueId': supersetTechniqueId,
      'trisetExerciseId': trisetExerciseId,
      'trisetSets': trisetSets,
      'trisetReps': trisetReps,
      'trisetTechniqueId': trisetTechniqueId,
    };
  }

  // Factory Constructor from Map
  factory WorkoutCard.fromMap(Map<String, dynamic> map) {
    return WorkoutCard(
      id: map['id'] ?? Isar.autoIncrement,
      athleteId: map['athleteId'],
      muscleGroupId: map['muscleGroupId'],
      exerciseId: map['exerciseId'],
      sets: map['sets'],
      reps: map['reps'],
      techniqueId: map['techniqueId'],
      supersetExerciseId: map['supersetExerciseId'],
      supersetSets: map['supersetSets'],
      supersetReps: map['supersetReps'],
      supersetTechniqueId: map['supersetTechniqueId'],
      trisetExerciseId: map['trisetExerciseId'],
      trisetSets: map['trisetSets'],
      trisetReps: map['trisetReps'],
      trisetTechniqueId: map['trisetTechniqueId'],
    );
  }

  @override
  String toString() {
    return '''
WorkoutCard:
  id: $id
  athleteId: $athleteId
  muscleGroupId: $muscleGroupId
  exerciseId: $exerciseId
  sets: $sets
  reps: $reps
  techniqueId: $techniqueId
  supersetExerciseId: $supersetExerciseId
  supersetSets: $supersetSets
  supersetReps: $supersetReps
  supersetTechniqueId: $supersetTechniqueId
  trisetExerciseId: $trisetExerciseId
  trisetSets: $trisetSets
  trisetReps: $trisetReps
  trisetTechniqueId: $trisetTechniqueId
''';
  }
}
