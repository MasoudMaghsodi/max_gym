import 'package:isar/isar.dart';

part 'exercise_category.g.dart';

@Collection()
class ExerciseCategory {
  Id id = Isar.autoIncrement;
  late String name;
  late String exercisesSerialized;

  @ignore
  late List<String> exercises;

  ExerciseCategory(this.name, String exercisesSerialized) {
    this.exercisesSerialized = exercisesSerialized;
    this.exercises = exercisesSerialized.split(',');
  }

  List<String> get exercisesList => exercisesSerialized.split(',');

  set exercisesList(List<String> value) {
    exercisesSerialized = value.join(',');
    exercises = value;
  }
}
