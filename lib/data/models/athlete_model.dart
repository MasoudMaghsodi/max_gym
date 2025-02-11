import 'package:isar/isar.dart';
part 'athlete_model.g.dart';

@collection
class Athlete {
  Id id = Isar.autoIncrement; // شناسه منحصر به فرد

  @Index(type: IndexType.value)
  String firstName; // نام
  @Index(type: IndexType.value)
  String lastName; // نام خانوادگی

  int age; // سن
  double height; // قد (سانتی‌متر)
  double weight; // وزن (کیلوگرم)
  String gender; // جنسیت (مثلاً مرد/زن)
  String goal; // هدف (مثلاً کاهش وزن، عضله‌سازی)
  String coachNote; // یادداشت مربی

  Athlete({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.goal,
    required this.coachNote,
  });

  /// ایجاد یک کپی از شیء با تغییرات دلخواه
  Athlete copyWith({
    Id? id,
    String? firstName,
    String? lastName,
    int? age,
    double? height,
    double? weight,
    String? gender,
    String? goal,
    String? coachNote,
  }) {
    return Athlete(
      // id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      goal: goal ?? this.goal,
      coachNote: coachNote ?? this.coachNote,
    );
  }

  /// تبدیل مدل به Map برای سازگاری با Supabase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'goal': goal,
      'coach_note': coachNote,
    };
  }

  /// ایجاد مدل از Map (برای Supabase)
  factory Athlete.fromMap(Map<String, dynamic> map) {
    return Athlete(
      firstName: map['first_name'],
      lastName: map['last_name'],
      age: map['age'],
      height: map['height'],
      weight: map['weight'],
      gender: map['gender'],
      goal: map['goal'],
      coachNote: map['coach_note'] ?? '', // مقدار پیش‌فرض برای coachNote
    );
  }
}
