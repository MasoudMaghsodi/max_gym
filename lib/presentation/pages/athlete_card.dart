import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../data/models/athlete_model.dart';
import '../providers/providers.dart';
import 'add_edit_athlete_page.dart';

class AthleteCard extends ConsumerWidget {
  final Athlete athlete;

  const AthleteCard({required this.athlete, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: _getGoalColor(athlete.goal),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text('${athlete.firstName} ${athlete.lastName}'),
        subtitle: Text('سن: ${athlete.age} | هدف: ${athlete.goal}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () => _syncAthlete(context, ref),
            ),
            PopupMenuButton(
              itemBuilder: (_) => [
                const PopupMenuItem(value: 'edit', child: Text('ویرایش')),
                const PopupMenuItem(value: 'delete', child: Text('حذف')),
                const PopupMenuItem(value: 'duplicate', child: Text('کپی')),
              ],
              onSelected: (value) => _handleAction(value, context, ref),
            ),
          ],
        ),
      ),
    );
  }

  // تعیین رنگ کارت بر اساس هدف ورزشکار
  Color _getGoalColor(String goal) {
    switch (goal) {
      case 'عضله‌سازی':
        return Colors.green.shade100;
      case 'کاهش وزن':
        return Colors.blue.shade100;
      default:
        return Colors.white;
    }
  }

  // مدیریت عملیات (ویرایش، حذف، کپی)
  void _handleAction(String value, BuildContext context, WidgetRef ref) async {
    switch (value) {
      case 'edit':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddEditAthletePage(athlete: athlete),
          ),
        ).then((_) {
          // بعد از ویرایش، لیست رو آپدیت کن
          // ignore: unused_result
          ref.refresh(athletesProvider);
        });
        break;
      case 'delete':
        final confirmed = await _confirmDelete(context);
        if (confirmed) {
          await ref.read(athleteRepositoryProvider).deleteAthlete(athlete.id);
          // ignore: unused_result
          ref.refresh(athletesProvider);
          // ignore: use_build_context_synchronously
          FocusScope.of(context).unfocus(); // برداشتن فوکوس بعد از حذف
        }
        break;
      case 'duplicate':
        // گرفتن لیست فعلی ورزشکارها
        final athletesAsync = ref.read(athletesProvider);
        final athletes = athletesAsync.value ?? [];

        // تولید lastName جدید با عدد افزایشی
        final newLastName = _generateCopyLastName(athlete.lastName, athletes);

        // ایجاد ورزشکار جدید با lastName به‌روزرسانی شده
        final newAthlete = athlete.copyWith(
          id: Isar.autoIncrement,
          lastName: newLastName,
        );

        // ذخیره همزمان در ایسار و سوپابیس
        await ref.read(athleteRepositoryProvider).saveAthlete(newAthlete);
        // ignore: unused_result
        ref.refresh(athletesProvider);
        // ignore: use_build_context_synchronously
        FocusScope.of(context).unfocus(); // برداشتن فوکوس بعد از کپی
        break;
    }
  }

  // نمایش دیالوگ تأیید حذف
  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('حذف ورزشکار'),
            content: const Text(
                'آیا مطمئن هستید که می‌خواهید این ورزشکار را حذف کنید؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('لغو'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('حذف'),
              ),
            ],
          ),
        ) ??
        false;
  }

  // تولید نام خانوادگی جدید برای ورزشکار کپی‌شده
  String _generateCopyLastName(String baseLastName, List<Athlete> athletes) {
    // پیدا کردن تمام ورزشکارهایی که lastNameشون با baseLastName شروع می‌شه
    final matchingLastNames = athletes
        .where((athlete) => athlete.lastName.startsWith(baseLastName))
        .map((athlete) => athlete.lastName)
        .toList();

    // اگر هیچ کپی‌ای وجود نداشت، عدد ۱ رو اضافه کن
    if (matchingLastNames.isEmpty) {
      return '$baseLastName ۱';
    }

    // پیدا کردن بزرگ‌ترین عدد موجود
    int maxNumber = 0;
    for (final lastName in matchingLastNames) {
      final regex = RegExp(r'(\d+)$');
      final match = regex.firstMatch(lastName);
      if (match != null) {
        final number = int.parse(match.group(1)!);
        if (number > maxNumber) {
          maxNumber = number;
        }
      }
    }

    // اضافه کردن یک عدد به بزرگ‌ترین عدد موجود
    return '$baseLastName ${maxNumber + 1}';
  }

  // سینک داده‌ها با سوپابیس
  void _syncAthlete(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(athleteRepositoryProvider).syncDataToSupabase();
      // ignore: unused_result
      ref.refresh(athletesProvider);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('داده‌ها با موفقیت سینک شدند')),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا در سینک داده‌ها: $e')),
      );
    }
  }
}
