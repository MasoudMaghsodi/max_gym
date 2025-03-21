import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/services/isar_service.dart';
import 'package:max_gym/services/settings_service.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('تنظیمات')),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          ListTile(
            title: const Text('تم برنامه'),
            trailing: DropdownButton<ThemeMode>(
              value: settings.themeMode,
              items: const [
                DropdownMenuItem(value: ThemeMode.system, child: Text('سیستم')),
                DropdownMenuItem(value: ThemeMode.light, child: Text('روشن')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('تیره')),
              ],
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(settingsServiceProvider.notifier)
                      .setThemeMode(value);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('زبان'),
            trailing: DropdownButton<String>(
              value: settings.language,
              items: const [
                DropdownMenuItem(value: 'fa', child: Text('فارسی')),
                DropdownMenuItem(value: 'en', child: Text('English')),
              ],
              onChanged: (value) {
                if (value != null) {
                  ref.read(settingsServiceProvider.notifier).setLanguage(value);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('پاکسازی کش'),
            trailing: ElevatedButton(
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('پاکسازی کش'),
                    content: const Text(
                        'آیا مطمئن هستید؟ تمام داده‌ها حذف می‌شوند.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('خیر'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('بله'),
                      ),
                    ],
                  ),
                );
                if (confirm == true) {
                  await IsarService.isar.writeTxn(() async {
                    await IsarService.isar.clear();
                  });
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('کش پاک شد')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
              child: const Text('پاک کردن'),
            ),
          ),
          ListTile(
            title: const Text('نسخه برنامه'),
            subtitle: const Text('1.0.0'),
          ),
          const ListTile(
            title: Text('درباره ما'),
            subtitle: Text('تیم Max Gym - برای بهترین تجربه تمرینی شما'),
          ),
        ],
      ),
    );
  }
}
