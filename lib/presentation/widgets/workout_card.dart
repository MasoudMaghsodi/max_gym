import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/data/models/workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutPlan workoutPlan;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const WorkoutCard({
    super.key,
    required this.workoutPlan,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(workoutPlan.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        color: AppColors.error,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        onLongPress: onEdit,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getDayName(workoutPlan.dayOfWeek),
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _getTypeText(workoutPlan.type),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _getTypeColor(workoutPlan.type),
                    ),
                  ),
                ],
              ),
              if (workoutPlan.type == 'training') ...[
                SizedBox(height: 5.h),
                Text(
                  'عضلات هدف: ${workoutPlan.targetMuscles.join(', ')}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(height: 5.h),
                LinearProgressIndicator(
                  value: _calculateProgress(),
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
                SizedBox(height: 5.h),
                ...workoutPlan.exerciseIds.map((id) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        children: [
                          Icon(Icons.fitness_center, size: 16.r),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Text(
                              'تمرین $id', // Placeholder, replace with actual exercise data if available
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _getDayName(int day) {
    const days = [
      'شنبه',
      'یک‌شنبه',
      'دوشنبه',
      'سه‌شنبه',
      'چهارشنبه',
      'پنج‌شنبه',
      'جمعه'
    ];
    return days[day];
  }

  String _getTypeText(String type) {
    switch (type) {
      case 'training':
        return 'تمرین';
      case 'rest':
        return 'استراحت';
      case 'off':
        return 'تعطیل';
      default:
        return 'نامشخص';
    }
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'training':
        return AppColors.primary;
      case 'rest':
        return Colors.grey;
      case 'off':
        return AppColors.error;
      default:
        return Colors.black;
    }
  }

  // ignore: unused_element
  IconData _getToolIcon(String? tool) {
    switch (tool) {
      case 'dumbbell':
        return Icons.fitness_center;
      case 'barbell':
        return Icons.sports_gymnastics;
      case 'machine':
        return Icons.build;
      default:
        return Icons.person;
    }
  }

  double _calculateProgress() {
    if (workoutPlan.exerciseIds.isEmpty) return 0.0;
    final totalExercises = workoutPlan.exerciseIds.length;
    return totalExercises > 0 ? (totalExercises / (totalExercises + 1)) : 0.0;
  }
}
