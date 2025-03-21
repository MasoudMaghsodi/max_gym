// import '../../data/models/athlete_model.dart';

// /// موجودیت ورزشکار برای استفاده در لایه دامین
// class AthleteEntity {
//   final int id; // شناسه منحصر به فرد
//   final String firstName; // نام
//   final String lastName; // نام خانوادگی
//   final int age; // سن
//   final double height; // قد (سانتی‌متر)
//   final double weight; // وزن (کیلوگرم)
//   final String gender; // جنسیت (مثلاً مرد/زن)
//   final String goal; // هدف (مثلاً کاهش وزن، عضله‌سازی)
//   final String coachNote; // یادداشت مربی

//   AthleteEntity({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.age,
//     required this.height,
//     required this.weight,
//     required this.gender,
//     required this.goal,
//     required this.coachNote,
//   });

//   /// تبدیل مدل [Athlete] به موجودیت [AthleteEntity]
//   factory AthleteEntity.fromModel(Athlete model) {
//     return AthleteEntity(
//       id: model.id,
//       firstName: model.firstName,
//       lastName: model.lastName,
//       age: model.age,
//       height: model.height,
//       weight: model.weight,
//       gender: model.gender,
//       goal: model.goal,
//       coachNote: model.coachNote,
//     );
//   }

//   /// تبدیل موجودیت [AthleteEntity] به مدل [Athlete]
//   Athlete toModel() {
//     return Athlete(
//       firstName: firstName,
//       lastName: lastName,
//       age: age,
//       height: height,
//       weight: weight,
//       gender: gender,
//       goal: goal,
//       coachNote: coachNote,
//       // id: id,
//     );
//   }

//   /// ایجاد یک نسخه کپی از موجودیت با مقادیر جدید (اختیاری)
//   AthleteEntity copyWith({
//     int? id,
//     String? firstName,
//     String? lastName,
//     int? age,
//     double? height,
//     double? weight,
//     String? gender,
//     String? goal,
//     String? coachNote,
//   }) {
//     return AthleteEntity(
//       id: id ?? this.id,
//       firstName: firstName ?? this.firstName,
//       lastName: lastName ?? this.lastName,
//       age: age ?? this.age,
//       height: height ?? this.height,
//       weight: weight ?? this.weight,
//       gender: gender ?? this.gender,
//       goal: goal ?? this.goal,
//       coachNote: coachNote ?? this.coachNote,
//     );
//   }
// }
