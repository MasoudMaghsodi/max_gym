class WorkoutExercise {
  String name;
  int sets;
  int reps;
  String? technique;
  String? superSet;
  int? superSetSets;
  int? superSetReps;
  String? superSetTechnique;
  String? triSet;
  int? triSetSets;
  int? triSetReps;
  String? triSetTechnique;

  WorkoutExercise(this.name, this.sets, this.reps,
      {this.technique,
      this.superSet,
      this.superSetSets,
      this.superSetReps,
      this.superSetTechnique,
      this.triSet,
      this.triSetSets,
      this.triSetReps,
      this.triSetTechnique});
}
