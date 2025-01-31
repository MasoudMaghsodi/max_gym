import 'package:isar/isar.dart';

part 'athlete_model.g.dart';

enum Gender { male, female }

@Collection()
class Athlete {
  Id id = Isar.autoIncrement;
  late String firstName;
  late String lastName;
  late int age;
  late double height;
  late double weight;

  @Enumerated(EnumType.name) // افزودن این خط
  late Gender gender;

  String? goal;
  String? coachNotes;
}
