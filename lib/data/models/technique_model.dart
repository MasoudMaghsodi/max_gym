import 'package:isar/isar.dart';

part 'technique_model.g.dart';

@Collection()
class Technique {
  Id id = Isar.autoIncrement;

  String name;
  String description;

  Technique({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Technique.fromJson(Map<String, dynamic> json) {
    return Technique(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    )..id = json['id'] ?? Isar.autoIncrement;
  }
}
