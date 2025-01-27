class WorkoutExercise {
  String name;
  int sets;
  int reps;
  String? superSet;
  int? superSetReps;
  String? superSetTechnique;
  String? triSet;
  int? triSetReps;
  String? triSetTechnique;
  String? technique;

  WorkoutExercise(this.name, this.sets, this.reps,
      {this.superSet,
      this.superSetReps,
      this.superSetTechnique,
      this.triSet,
      this.triSetReps,
      this.triSetTechnique,
      this.technique});
}
