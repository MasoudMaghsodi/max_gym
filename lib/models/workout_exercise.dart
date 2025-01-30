import 'package:isar/isar.dart';

part 'workout_exercise.g.dart';

@Collection()
class WorkoutExercise {
  Id id = Isar.autoIncrement;

  @Index() // اضافه کردن ایندکس برای فیلد name
  late String name;

  String? technique;
  late int sets;
  late int reps;
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
}
