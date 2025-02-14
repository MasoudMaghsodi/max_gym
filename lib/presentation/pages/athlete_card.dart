import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/athlete_model.dart';
import '../providers/providers.dart';
import 'add_edit_athlete_page.dart';
import 'workout_plan_page.dart';

class AthleteCard extends ConsumerWidget {
  final Athlete athlete;
  final VoidCallback? onDelete;

  const AthleteCard({
    required this.athlete,
    this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: _getGoalColor(athlete.goal),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: Text(
            '${athlete.firstName[0]}${athlete.lastName[0]}',
            style: const TextStyle(color: AppColors.primary),
          ),
        ),
        title: Text(
          '${athlete.firstName} ${athlete.lastName}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('سن: ${athlete.age}'),
            Text('هدف: ${athlete.goal}'),
            Text(
              athlete.gender,
              style: TextStyle(
                color: athlete.gender == 'مرد' ? Colors.blue : Colors.pink,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.fitness_center),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WorkoutPlanPage(athleteId: athlete.id),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.sync, color: Colors.grey.shade600),
              onPressed: () => _syncAthlete(context, ref),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit, color: AppColors.primary),
                    title: Text('ویرایش'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'duplicate',
                  child: ListTile(
                    leading: Icon(Icons.copy, color: AppColors.primary),
                    title: Text('کپی'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text('حذف', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
              onSelected: (value) => _handleAction(value, context, ref),
            ),
          ],
        ),
      ),
    );
  }

  Color _getGoalColor(String goal) {
    switch (goal) {
      case 'عضله‌ سازی':
        return Colors.green.shade50;
      case 'کاهش وزن':
        return Colors.blue.shade50;
      default:
        return Colors.white;
    }
  }

  void _handleAction(String value, BuildContext context, WidgetRef ref) async {
    switch (value) {
      case 'edit':
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddEditAthletePage(athlete: athlete),
          ),
        );
        // ignore: unused_result
        ref.refresh(athletesProvider);
        break;

      case 'delete':
        final confirmed = await _confirmDelete(context);
        if (confirmed) {
          try {
            await ref.read(athleteRepositoryProvider).deleteAthlete(athlete.id);
            onDelete?.call(); // فراخوانی متد onDelete
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('ورزشکار با موفقیت حذف شد'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('خطا در حذف ورزشکار: ${e.toString()}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        }
        break;

      case 'duplicate':
        final athletes = ref.read(athletesProvider).value ?? [];
        final newLastName = _generateCopyLastName(athlete.lastName, athletes);

        final newAthlete = athlete.copyWith(
          id: Isar.autoIncrement,
          lastName: newLastName,
        );

        try {
          await ref.read(athleteRepositoryProvider).saveAthlete(newAthlete);
          // ignore: unused_result
          ref.refresh(athletesProvider);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('ورزشکار با موفقیت کپی شد'),
                backgroundColor: Colors.green,
              ),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('خطا در کپی ورزشکار: ${e.toString()}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
        break;
    }
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('حذف ورزشکار'),
            content: const Text(
                'آیا مطمئن هستید می‌خواهید این ورزشکار را حذف کنید؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('لغو', style: TextStyle(color: Colors.grey)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('حذف', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }

  String _generateCopyLastName(String baseLastName, List<Athlete> athletes) {
    final regex = RegExp(r'^(.+?)(\s*(\d+))?$');
    final match = regex.firstMatch(baseLastName);
    final baseName = match?.group(1) ?? baseLastName;
    final existingNumbers = athletes
        .where((a) => a.lastName.startsWith(baseName))
        .map((a) =>
            int.tryParse(regex.firstMatch(a.lastName)?.group(3) ?? '') ?? 0)
        .toList();

    final maxNumber = existingNumbers.isNotEmpty
        ? existingNumbers.reduce((a, b) => a > b ? a : b)
        : 0;
    return '$baseName ${maxNumber + 1}';
  }

  void _syncAthlete(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(athleteRepositoryProvider).syncDataToSupabase();
      // ignore: unused_result
      ref.refresh(athletesProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('داده‌ها با موفقیت سینک شدند'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا در سینک داده‌ها: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
