import 'package:isar/isar.dart';

part 'techniques.g.dart';

@Collection()
class Technique {
  Id id = Isar.autoIncrement;

  late String name;
  late String description;

  Technique({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Technique.fromMap(Map<String, dynamic> map) {
    return Technique(
      name: map['name'],
      description: map['description'],
    )..id = map['id'];
  }
}
