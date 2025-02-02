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

  @Enumerated(EnumType.name)
  late Gender gender;

  String? goal;
  String? coachNotes;

  Athlete copyWith({
    Id? id,
    String? firstName,
    String? lastName,
    int? age,
    double? height,
    double? weight,
    Gender? gender,
    String? goal,
    String? coachNotes,
  }) {
    return Athlete()
      ..id = id ?? this.id
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..age = age ?? this.age
      ..height = height ?? this.height
      ..weight = weight ?? this.weight
      ..gender = gender ?? this.gender
      ..goal = goal ?? this.goal
      ..coachNotes = coachNotes ?? this.coachNotes;
  }
}
