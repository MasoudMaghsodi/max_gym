import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/exerciseProviders/exercise_list_provider.dart';

class ExerciseSelectionScreen extends ConsumerWidget {
  final int muscleGroupId;
  const ExerciseSelectionScreen({super.key, required this.muscleGroupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(exerciseListProvider(muscleGroupId));

    return exercises.when(
      data: (exerciseList) => ListView.builder(
        itemCount: exerciseList.length,
        itemBuilder: (context, index) {
          final exercise = exerciseList[index];
          return ListTile(
            title: Text(exercise.name),
            onTap: () {
              // ذخیره انتخاب تمرین
            },
          );
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text("خطا در بارگیری"),
    );
  }
}
