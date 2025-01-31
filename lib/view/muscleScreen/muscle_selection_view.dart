import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/muscleProviders/muscle_group_provider.dart';
import '../exerciseScreen/exercise_selection_view.dart';

class MuscleSelectionScreen extends ConsumerWidget {
  const MuscleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // گرفتن داده‌ها از provider
    final muscles = ref.watch(muscleGroupProvider);

    return muscles.when(
      data: (muscleGroups) => ListView.builder(
        itemCount: muscleGroups.length,
        itemBuilder: (context, index) {
          final muscle = muscleGroups[index];
          return ListTile(
            title: Text(muscle.name),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ExerciseSelectionScreen(muscleGroupId: muscle.id),
                  ));
            },
          );
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text("خطا در بارگیری"),
    );
  }
}
