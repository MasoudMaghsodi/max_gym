import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/presentation/providers/providers.dart';
import 'package:max_gym/data/models/workout_model.dart' as model;
import 'package:max_gym/presentation/widgets/workout_card.dart';

import '../widgets/add_exercise_dialog_widget.dart';

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
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.primary,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                tabs: const [
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
          ),
        ),
        body: workoutPlansAsync.when(
          data: (plans) => TabBarView(
            children:
                List.generate(7, (index) => _buildDayPlan(plans, index, ref)),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (error, _) => Center(
            child: Text(
              'خطا در دریافت برنامه‌ها: ${error.toString()}',
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () => _addWorkout(context, ref),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDayPlan(
      List<model.WorkoutPlan> plans, int dayIndex, WidgetRef ref) {
    final dayName = _getDayName(dayIndex);
    final dayPlans = plans.where((plan) => plan.day == dayName).toList();

    return dayPlans.isEmpty
        ? _buildRestDay()
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: dayPlans.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) => WorkoutCard(
              workout: dayPlans[index],
              onDelete: () => _deleteWorkout(dayPlans[index].id, ref),
            ),
          );
  }

  Widget _buildRestDay() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bedtime_rounded, size: 60, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'روز استراحت',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getDayName(int index) {
    const days = [
      'شنبه',
      'یکشنبه',
      'دوشنبه',
      'سه‌شنبه',
      'چهارشنبه',
      'پنج‌شنبه',
      'جمعه'
    ];
    return days[index];
  }

  void _addWorkout(BuildContext context, WidgetRef ref) {
    final currentTabIndex = DefaultTabController.of(context).index;
    final currentDay = _getDayName(currentTabIndex);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddExerciseDialog(
          onSave: (exerciseData) async {
            final workout = WorkoutPlan(
              id: Isar.autoIncrement,
              athleteId: athleteId,
              day: currentDay,
              isRestDay: false,
              exercises: [
                WorkoutExercise(
                  exerciseName: exerciseData['name'],
                  sets: exerciseData['sets'],
                  reps: exerciseData['reps'],
                  technique: exerciseData['technique'],
                ),
              ],
            );

            try {
              await ref
                  .read(workoutRepositoryProvider)
                  .saveWorkoutPlan(workout);
              // ignore: unused_result
              ref.refresh(workoutPlansProvider(athleteId));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تمرین با موفقیت اضافه شد'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('خطا در افزودن تمرین: ${e.toString()}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _deleteWorkout(int id, WidgetRef ref) async {
    try {
      await ref.read(workoutRepositoryProvider).deleteWorkoutPlan(id);
      // ignore: unused_result
      ref.refresh(workoutPlansProvider(athleteId));
    } catch (e) {
      debugPrint('خطا در حذف برنامه: ${e.toString()}');
    }
  }
}
