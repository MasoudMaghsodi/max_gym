import 'package:flutter/material.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/core/constants/app_colors.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutPlan workout;
  final VoidCallback onDelete;

  WorkoutCard({
    required this.workout,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Icon(
          workout.isRestDay ? Icons.bedtime_rounded : Icons.fitness_center,
          color: AppColors.primary,
        ),
        title: Text(
          workout.day,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          workout.isRestDay
              ? 'روز استراحت'
              : 'تعداد تمرینات: ${workout.exercises.length}',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
        trailing: PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('حذف', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
          onSelected: (value) => _handleDelete(context),
        ),
        children: [
          if (workout.isRestDay)
            _buildRestDayContent()
          else
            ...workout.exercises.map(_buildExerciseCard).toList(),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(WorkoutExercise exercise) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: const Icon(Icons.repeat, color: AppColors.primary),
        title: Text(
          exercise.exerciseName ?? 'بدون نام',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (exercise.sets != null)
              Text('ست‌ها: ${exercise.sets}', style: _detailStyle),
            if (exercise.reps != null)
              Text('تکرارها: ${exercise.reps}', style: _detailStyle),
            if (exercise.technique != null)
              Text('تکنیک: ${exercise.technique}', style: _detailStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildRestDayContent() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'این روز به عنوان روز استراحت تنظیم شده است',
        style: TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _handleDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف برنامه تمرینی'),
        content:
            const Text('آیا مطمئن هستید می‌خواهید این برنامه را حذف کنید؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('لغو', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
              _showSuccessSnackbar(context);
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('برنامه تمرینی با موفقیت حذف شد'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ));
  }

  final TextStyle _detailStyle = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 13,
  );
}
