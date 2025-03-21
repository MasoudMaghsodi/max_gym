import 'package:isar/isar.dart';

part 'athlete_model.g.dart';

@Collection()
class Athlete {
  Id id = Isar.autoIncrement;

  @Index()
  String firstName;

  @Index()
  String lastName;

  int? age;
  double? height;
  double? weight;
  String? gender;
  String? goal;
  String? coachNote;
  bool isSynced;
  DateTime? lastModified;

  List<String> tags;

  Athlete({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.goal,
    required this.coachNote,
    this.isSynced = false,
    DateTime? lastModified,
    this.tags = const [],
  }) : lastModified = lastModified ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'goal': goal,
      'coachNote': coachNote,
      'isSynced': isSynced,
      'lastModified': lastModified?.toIso8601String(),
      'tags': tags,
    };
  }

  factory Athlete.fromJson(Map<String, dynamic> json) {
    return Athlete(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      age: json['age'],
      height: json['height']?.toDouble(),
      weight: json['weight']?.toDouble(),
      gender: json['gender'],
      goal: json['goal'],
      coachNote: json['coachNote'],
      isSynced: json['isSynced'] ?? false,
      lastModified: json['lastModified'] != null
          ? DateTime.parse(json['lastModified'])
          : null,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
    )..id = json['id'] ?? Isar.autoIncrement;
  }
}
