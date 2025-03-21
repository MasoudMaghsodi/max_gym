// import 'package:flutter/material.dart';
// import 'package:max_gym/core/constants/app_colors.dart';
// import 'package:max_gym/data/models/workout_model.dart';

// class DayWorkoutCard extends StatelessWidget {
//   final WorkoutPlan dayPlan;
//   final VoidCallback onDelete;
//   final VoidCallback onEdit;

//   const DayWorkoutCard({
//     required this.dayPlan,
//     required this.onDelete,
//     required this.onEdit,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: ExpansionTile(
//         leading: Icon(
//           dayPlan.isRestDay ? Icons.bedtime_rounded : Icons.fitness_center,
//           color: AppColors.primary,
//         ),
//         title: Text(
//           dayPlan.day,
//           style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//         ),
//         subtitle: Text(
//           dayPlan.isRestDay
//               ? 'روز استراحت'
//               : 'تمرینات: ${dayPlan.exercises.length}',
//           style: TextStyle(color: Colors.grey.shade600),
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.edit, color: AppColors.primary),
//               onPressed: onEdit,
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () => _confirmDelete(context),
//             ),
//           ],
//         ),
//         children: [
//           if (dayPlan.isRestDay)
//             _buildRestDayContent()
//           else
//             ...dayPlan.exercises
//                 .map((e) => WorkoutCardItem(card: e, onEdit: () {})),
//         ],
//       ),
//     );
//   }

//   Widget _buildRestDayContent() {
//     return const Padding(
//       padding: EdgeInsets.all(16),
//       child: Text(
//         'این روز به عنوان روز استراحت تنظیم شده است',
//         style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   void _confirmDelete(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('حذف روز تمرینی'),
//         content: const Text('آیا مطمئن هستید می‌خواهید این روز را حذف کنید؟'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('لغو', style: TextStyle(color: Colors.grey)),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               onDelete();
//             },
//             child: const Text('حذف', style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WorkoutCardItem extends StatelessWidget {
//   final WorkoutExercise card;
//   final VoidCallback onEdit;

//   const WorkoutCardItem({
//     required this.card,
//     required this.onEdit,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade50,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//         leading: const Icon(Icons.repeat, color: AppColors.primary),
//         title: Text(card.exercise?.name ?? 'بدون نام',
//             style: const TextStyle(fontWeight: FontWeight.w500)),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (card.sets != null) _buildDetailItem('ست‌ها', '${card.sets}'),
//             if (card.reps != null) _buildDetailItem('تکرارها', '${card.reps}'),
//             if (card.technique != null)
//               _buildDetailItem('تکنیک', card.technique!.name ?? ''),
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.edit, color: AppColors.primary),
//           onPressed: onEdit,
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailItem(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Text('$title: ', style: TextStyle(color: Colors.grey.shade700)),
//           Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }
// }
