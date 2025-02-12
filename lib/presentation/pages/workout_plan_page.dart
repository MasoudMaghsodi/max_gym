import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:max_gym/presentation/providers/providers.dart';
import '../../data/models/workout_model.dart' as model;
import '../widgets/add_workout_dialog.dart';
import '../widgets/workout_card.dart';

class WorkoutPlanPage extends ConsumerWidget {
  final int athleteId;

  const WorkoutPlanPage({required this.athleteId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutPlansAsync = ref.watch(workoutPlansProvider(athleteId));

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('برنامه هفتگی'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'شنبه'),
              Tab(text: 'یکشنبه'),
              Tab(text: 'دوشنبه'),
              Tab(text: 'سه‌شنبه'),
              Tab(text: 'چهارشنبه'),
              Tab(text: 'پنج‌شنبه'),
              Tab(text: 'جمعه'),
            ],
          ),
        ),
        body: workoutPlansAsync.when(
          data: (plans) => TabBarView(
            children: List.generate(7, (index) => _buildDayPlan(plans, index)),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('خطا: $error')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addWorkout(context, ref),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildDayPlan(List<model.WorkoutPlan> plans, int dayIndex) {
    final dayPlans =
        plans.where((plan) => plan.day == _getDayName(dayIndex)).toList();

    if (dayPlans.isEmpty) {
      return const Center(child: Text('روز استراحت'));
    }

    return ListView.builder(
      itemCount: dayPlans.length,
      itemBuilder: (_, index) => WorkoutCard(workout: dayPlans[index]),
    );
  }

  String _getDayName(int index) {
    switch (index) {
      case 0:
        return 'شنبه';
      case 1:
        return 'یکشنبه';
      case 2:
        return 'دوشنبه';
      case 3:
        return 'سه‌شنبه';
      case 4:
        return 'چهارشنبه';
      case 5:
        return 'پنج‌شنبه';
      case 6:
        return 'جمعه';
      default:
        return '';
    }
  }

  void _addWorkout(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (_) => AddWorkoutDialog(
        onSave: (workout) async {
          await ref.read(workoutRepositoryProvider).saveWorkoutPlan(workout);
          // ignore: unused_result
          ref.refresh(workoutPlansProvider(athleteId));
        },
      ),
    );
  }
}
