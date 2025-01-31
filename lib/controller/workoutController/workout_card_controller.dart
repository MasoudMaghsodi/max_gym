import 'package:isar/isar.dart';

import '../../model/workoutModel/workout_card_model.dart';

class WorkoutCardController {
  final Isar isar;

  WorkoutCardController(this.isar);

  Future<void> saveWorkout(WorkoutCard workout) async {
    await isar.writeTxn(() async {
      await isar.workoutCards.put(workout);
    });
  }
}
