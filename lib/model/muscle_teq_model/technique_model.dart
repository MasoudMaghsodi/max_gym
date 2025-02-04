import 'package:isar/isar.dart';
part 'technique_model.g.dart';

@Collection()
class Technique {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String name;

  @Index(type: IndexType.value)
  late String nameEnglish;

  // CopyWith Method for Immutability
  Technique copyWith({
    Id? id,
    String? name,
    String? nameEnglish,
  }) {
    return Technique()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..nameEnglish = nameEnglish ?? this.nameEnglish;
  }

  @override
  String toString() {
    return '''
Technique:
  id: $id
  name: $name
  nameEnglish: $nameEnglish
''';
  }
}

// داده‌های پیشفرض تکنیک‌ها
final defaultTechniques = [
  Technique()
    ..name = 'سوپرست'
    ..nameEnglish = 'Superset',
  Technique()
    ..name = 'ترای‌ست'
    ..nameEnglish = 'Tri-set',
  Technique()
    ..name = 'دراپ ست'
    ..nameEnglish = 'Drop Set',
  Technique()
    ..name = 'فراسِت'
    ..nameEnglish = 'Giant Set',
  Technique()
    ..name = 'هرمی صعودی'
    ..nameEnglish = 'Ascending Pyramid',
  Technique()
    ..name = 'هرمی نزولی'
    ..nameEnglish = 'Descending Pyramid',
  Technique()
    ..name = 'رِپ‌ها با توقف'
    ..nameEnglish = 'Rep with Hold',
  Technique()
    ..name = 'تکرارهای نگاتیو'
    ..nameEnglish = 'Negative Reps',
  Technique()
    ..name = 'تکرارهای جزئی'
    ..nameEnglish = 'Partial Reps',
  Technique()
    ..name = 'تکرارهای شتاب‌دار'
    ..nameEnglish = 'Accelerated Reps',
  Technique()
    ..name = 'تمرین ایستایی'
    ..nameEnglish = 'Static Training',
  Technique()
    ..name = 'پلایومتریک'
    ..nameEnglish = 'Plyometrics',
  Technique()
    ..name = 'تمرین ایزومتریک'
    ..nameEnglish = 'Isometric Training',
  Technique()
    ..name = 'تمرین متمرکز'
    ..nameEnglish = 'Concentrated Training',
  Technique()
    ..name = 'TUT (مدت زمان تنش عضلانی)'
    ..nameEnglish = 'Time Under Tension (TUT)',
  Technique()
    ..name = 'Rest-Pause (استراحت-توقف)'
    ..nameEnglish = 'Rest-Pause',
  Technique()
    ..name = 'Forced Reps (تکرارهای اجباری)'
    ..nameEnglish = 'Forced Reps',
  Technique()
    ..name = 'Cheat Reps (تکرارهای تقلبی)'
    ..nameEnglish = 'Cheat Reps',
  Technique()
    ..name = 'Pre-Exhaustion (پیش خستگی)'
    ..nameEnglish = 'Pre-Exhaustion',
];
