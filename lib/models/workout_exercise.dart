class WorkoutExercise {
  // نام تمرین
  String name;
  // تعداد ست‌ها
  int sets;
  // تعداد تکرارها
  int reps;
  // نام سوپرست (در صورت وجود)
  String? superSet;
  // تعداد تکرارهای سوپرست (در صورت وجود)
  int? superSetReps;
  // تکنیک سوپرست (در صورت وجود)
  String? superSetTechnique;
  // نام تریست (در صورت وجود)
  String? triSet;
  // تعداد تکرارهای تریست (در صورت وجود)
  int? triSetReps;
  // تکنیک تریست (در صورت وجود)
  String? triSetTechnique;
  // تکنیک تمرین اصلی
  String? technique;

  // سازنده کلاس برای مقداردهی اولیه تمرین
  WorkoutExercise(
    this.name,
    this.sets,
    this.reps, {
    this.superSet,
    this.superSetReps,
    this.superSetTechnique,
    this.triSet,
    this.triSetReps,
    this.triSetTechnique,
    this.technique,
  });
}
