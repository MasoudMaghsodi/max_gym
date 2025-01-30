import 'package:isar/isar.dart';

part 'profile.g.dart';

@collection
class Profile {
  Id id = Isar.autoIncrement;

  late String firstName;
  late String lastName;
  late String age;
  late String weight;
  late String height;
  late String gender;
  late String goal;
  late String coachNotes;

  Profile();

  Map<String, String> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'weight': weight,
      'height': height,
      'gender': gender,
      'goal': goal,
      'coachNotes': coachNotes,
    };
  }

  Profile.fromMap(Map<String, String> map) {
    firstName = map['firstName'] ?? '';
    lastName = map['lastName'] ?? '';
    age = map['age'] ?? '';
    weight = map['weight'] ?? '';
    height = map['height'] ?? '';
    gender = map['gender'] ?? '';
    goal = map['goal'] ?? '';
    coachNotes = map['coachNotes'] ?? '';
  }
}
