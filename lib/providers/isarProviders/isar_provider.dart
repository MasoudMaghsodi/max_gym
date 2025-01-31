import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import '../../model/athleteModel/athlete_model.dart';
import '../../model/exerciseModel/exercise_model.dart';
import '../../model/muscle_teq_model/muscle_group_model.dart';
import '../../model/muscle_teq_model/technique_model.dart';
import '../../model/dayModel/week_day_model.dart';
import '../../model/workoutModel/workout_card_model.dart';

final isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open([
    AthleteSchema,
    MuscleGroupSchema,
    ExerciseSchema,
    TechniqueSchema,
    WorkoutCardSchema,
    WeekDaySchema
  ], directory: dir.path);
});
