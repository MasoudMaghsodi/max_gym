import 'package:isar/isar.dart';
part 'workout_card_model.g.dart';

@Collection()
class WorkoutCard {
  Id id = Isar.autoIncrement;
  late int athleteId; // ورزشکاری که این برنامه براش ثبت شده
  late int muscleGroupId; // عضله هدف
  late int exerciseId; // تمرین اصلی
  late int sets; // تعداد ست
  late int reps; // تعداد تکرار
  int? techniqueId; // تکنیک (اختیاری)

  int? supersetExerciseId; // تمرین سوپرست (اختیاری)
  int? supersetSets;
  int? supersetReps;
  int? supersetTechniqueId;

  int? trisetExerciseId; // تمرین تریست (اختیاری)
  int? trisetSets;
  int? trisetReps;
  int? trisetTechniqueId;
}
