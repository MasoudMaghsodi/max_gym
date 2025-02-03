import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../providers/exerciseProviders/exercise_list_provider.dart';
import '../../providers/muscleProviders/muscle_group_provider.dart';
import '../../widgets/exerciseWidgets/day_card.dart';
import '../../widgets/exerciseWidgets/workout_card.dart';

class WorkoutPage extends ConsumerWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final muscleGroupsAsync = ref.watch(muscleGroupProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامه تمرینات روزانه'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // نمایش لیست روزهای هفته
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return DayCard(day: 'روز ${index + 1}');
              },
            ),
          ),
          // بررسی وضعیت بارگذاری گروه‌های عضلانی
          Expanded(
            child: muscleGroupsAsync.when(
              data: (muscleGroups) {
                if (muscleGroups.isEmpty) {
                  return const Center(
                      child: Text('هیچ گروه عضلانی ثبت نشده است.'));
                }

                final exercisesAsync =
                    ref.watch(exerciseListProvider(muscleGroups.first.id));

                return exercisesAsync.when(
                  data: (exercises) {
                    if (exercises.isEmpty) {
                      return const Center(child: Text('هیچ تمرینی یافت نشد.'));
                    }

                    return ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = exercises[index];

                        return WorkoutCard(
                          name: exercise.name,
                          muscleGroup:
                              exercise.muscleGroup.value?.name ?? 'نامشخص',
                          sets: 3,
                          reps: 12,
                          technique: '',
                          // sets: exercise.sets ?? 3, // مقدار پیش‌فرض 3
                          // reps: exercise.reps ?? 10, // مقدار پیش‌فرض 10
                          // technique: exercise.technique?.name ?? 'بدون تکنیک',
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) =>
                      Center(child: Text('خطا در بارگذاری تمرینات: $error')),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                  child: Text('خطا در بارگذاری گروه‌های عضلانی: $error')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // افزودن تمرین جدید
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
