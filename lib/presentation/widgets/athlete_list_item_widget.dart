// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:isar/isar.dart';
// import 'package:max_gym/core/constants/app_colors.dart';
// import 'package:max_gym/data/models/athlete_model.dart';
// import 'package:max_gym/presentation/providers/providers.dart';
// import 'package:max_gym/presentation/pages/add_edit_athlete_page.dart';

// class AthleteListItem extends ConsumerWidget {
//   final Athlete athlete;
//   final VoidCallback? onDelete;
//   final VoidCallback? onDuplicate;

//   const AthleteListItem({
//     required this.athlete,
//     this.onDelete,
//     this.onDuplicate,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         leading: CircleAvatar(
//           backgroundColor: AppColors.primary.withAlpha(26), // 0.1 opacity
//           child: Text(
//             '${athlete.firstName[0]}${athlete.lastName[0]}',
//             style: const TextStyle(
//               color: AppColors.primary,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         title: Text(
//           '${athlete.firstName} ${athlete.lastName}',
//           style: const TextStyle(fontWeight: FontWeight.w600),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('سن: ${athlete.age}'),
//             Text('هدف: ${athlete.goal}'),
//             Text(
//               athlete.gender,
//               style: TextStyle(
//                 color: athlete.gender == 'مرد' ? Colors.blue : Colors.pink,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         trailing: PopupMenuButton<String>(
//           icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
//           itemBuilder: (_) => [
//             PopupMenuItem(
//               value: 'edit',
//               child: ListTile(
//                 leading: const Icon(Icons.edit, color: AppColors.primary),
//                 title: const Text('ویرایش'),
//                 onTap: () => _handleEdit(context),
//               ),
//             ),
//             PopupMenuItem(
//               value: 'duplicate',
//               child: ListTile(
//                 leading: const Icon(Icons.copy, color: AppColors.primary),
//                 title: const Text('کپی'),
//                 onTap: () => _handleDuplicate(ref, context),
//               ),
//             ),
//             PopupMenuItem(
//               value: 'delete',
//               child: ListTile(
//                 leading: const Icon(Icons.delete, color: Colors.red),
//                 title: const Text('حذف', style: TextStyle(color: Colors.red)),
//                 onTap: () => _handleDelete(ref, context),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _handleEdit(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => AddEditAthletePage(athlete: athlete),
//       ),
//     ).then((_) => onDuplicate?.call());
//   }

//   Future<void> _handleDuplicate(WidgetRef ref, BuildContext context) async {
//     try {
//       final athletes = ref.read(athletesProvider).value ?? [];
//       final newLastName = _generateCopyLastName(athlete.lastName, athletes);

//       final newAthlete = Athlete(
//         id: Isar.autoIncrement,
//         firstName: athlete.firstName,
//         lastName: newLastName,
//         age: athlete.age,
//         height: athlete.height,
//         weight: athlete.weight,
//         gender: athlete.gender,
//         goal: athlete.goal,
//         coachNote: athlete.coachNote,
//       );

//       await ref.read(athleteRepositoryProvider).saveAthlete(newAthlete);
//       // ignore: unused_result
//       ref.refresh(athletesProvider);
//       onDuplicate?.call();

//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('ورزشکار با موفقیت کپی شد'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('خطا در کپی ورزشکار: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   Future<void> _handleDelete(WidgetRef ref, BuildContext context) async {
//     final confirmed = await showDialog<bool>(
//           context: context,
//           builder: (_) => AlertDialog(
//             title: const Text('حذف ورزشکار'),
//             content: const Text(
//                 'آیا مطمئن هستید می‌خواهید این ورزشکار را حذف کنید؟'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context, false),
//                 child: const Text('لغو', style: TextStyle(color: Colors.grey)),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context, true),
//                 child: const Text('حذف', style: TextStyle(color: Colors.red)),
//               ),
//             ],
//           ),
//         ) ??
//         false;

//     if (confirmed) {
//       try {
//         await ref.read(athleteRepositoryProvider).deleteAthlete(athlete.id);
//         // ignore: unused_result
//         ref.refresh(athletesProvider);
//         onDelete?.call();

//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('ورزشکار با موفقیت حذف شد'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       } catch (e) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('خطا در حذف ورزشکار: $e'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       }
//     }
//   }

//   String _generateCopyLastName(String baseLastName, List<Athlete> athletes) {
//     final regex = RegExp(r'^(.+?)(\s*(\d+))?$');
//     final match = regex.firstMatch(baseLastName);
//     final baseName = match?.group(1) ?? baseLastName;
//     final existingNumbers = athletes
//         .where((a) => a.lastName.startsWith(baseName))
//         .map((a) =>
//             int.tryParse(regex.firstMatch(a.lastName)?.group(3) ?? '') ?? 0)
//         .toList();

//     final maxNumber = existingNumbers.isNotEmpty
//         ? existingNumbers.reduce((a, b) => a > b ? a : b)
//         : 0;
//     return '$baseName ${maxNumber + 1}';
//   }
// }
