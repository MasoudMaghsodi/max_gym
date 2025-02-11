import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:max_gym/presentation/widgets/day_workout_widget.dart';

import '../providers/providers.dart';

class WorkoutPlanPage extends ConsumerWidget {
  final int athleteId;

  const WorkoutPlanPage({required this.athleteId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutPlansAsync = ref.watch(workoutPlansProvider(athleteId));
    return Scaffold(
      appBar: AppBar(title: const Text('برنامه تمرینی')),
      body: workoutPlansAsync.when(
        data: (plans) => ListView.builder(
            itemCount: plans.length,
            itemBuilder: (_, index) => DayWorkoutCard(dayPlan: plans[index])),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('خطا: $error')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewDay(context, ref),
          child: const Icon(Icons.add)),
    );
  }

  void _addNewDay(BuildContext context, WidgetRef ref) {
    // منطق افزودن روز جدید
  }
}
