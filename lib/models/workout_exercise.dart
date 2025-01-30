class WorkoutExercise {
  String name;
  String? technique;
  int sets;
  int reps;
  String? superSet;
  int? superSetReps;
  int? superSetSets;
  String? superSetTechnique;
  String? triSet;
  int? triSetReps;
  int? triSetSets;
  String? triSetTechnique;

  WorkoutExercise(
    this.name,
    this.sets,
    this.reps, {
    this.technique,
    this.superSet,
    this.superSetReps,
    this.superSetSets,
    this.superSetTechnique,
    this.triSet,
    this.triSetReps,
    this.triSetSets,
    this.triSetTechnique,
  });

  WorkoutExercise copyWith({
    String? name,
    String? technique,
    int? sets,
    int? reps,
    String? superSet,
    int? superSetReps,
    int? superSetSets,
    String? superSetTechnique,
    String? triSet,
    int? triSetReps,
    int? triSetSets,
    String? triSetTechnique,
  }) {
    return WorkoutExercise(
      name ?? this.name,
      sets ?? this.sets,
      reps ?? this.reps,
      technique: technique ?? this.technique,
      superSet: superSet ?? this.superSet,
      superSetReps: superSetReps ?? this.superSetReps,
      superSetSets: superSetSets ?? this.superSetSets,
      superSetTechnique: superSetTechnique ?? this.superSetTechnique,
      triSet: triSet ?? this.triSet,
      triSetReps: triSetReps ?? this.triSetReps,
      triSetSets: triSetSets ?? this.triSetSets,
      triSetTechnique: triSetTechnique ?? this.triSetTechnique,
    );
  }
}
