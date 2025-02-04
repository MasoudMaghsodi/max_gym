import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';

// Importing all models and their schemas
import '../../model/athleteModel/athlete_model.dart';
import '../../model/exerciseModel/exercise_model.dart';
import '../../model/muscle_teq_model/muscle_group_model.dart';
import '../../model/muscle_teq_model/technique_model.dart';
import '../../model/dayModel/week_day_model.dart';
import '../../model/workoutModel/workout_card_model.dart';

// Provider for initializing and providing Isar instance
final isarProvider = FutureProvider<Isar>((ref) async {
  try {
    // Get the application's document directory
    final dir = await getApplicationDocumentsDirectory();

    // Open the Isar database with all required schemas
    return await Isar.open(
      [
        AthleteSchema,
        MuscleGroupSchema,
        ExerciseSchema,
        TechniqueSchema,
        WorkoutCardSchema,
        WeekDaySchema,
      ],
      directory: dir.path,
    );
  } catch (e) {
    throw Exception('⚠️ خطا در ایجاد پایگاه داده Isar: ${e.toString()}');
  }
});
