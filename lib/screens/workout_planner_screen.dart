import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/workout_day.dart';
import '../widgets/exerciseWidgets/exercise_card.dart';
import '../providers/workout_provider.dart';

class WorkoutPlannerScreen extends ConsumerWidget {
  final Map<String, String> profileData;
  final List<WorkoutDay> workoutDays;

  const WorkoutPlannerScreen({
    super.key,
    required this.profileData,
    required this.workoutDays,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutNotifier = ref.read(workoutProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامه تمرینات هفتگی'),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                workoutNotifier.setWorkouts([]), // ریست کردن تمامی تمرینات
            tooltip: 'ریست کردن تمامی تمرینات',
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Image.asset(
                'assets/image/max.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: workoutDays.map((day) {
              return ExerciseCard(day: day, profileData: profileData);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
