import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/presentation/providers/providers.dart';
import 'package:max_gym/services/backup_service.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final athletesAsync = ref.watch(athletesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('آمار')),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('آمار کلی',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            athletesAsync.when(
              data: (athletes) => Column(
                children: [
                  _buildStatTile('تعداد ورزشکارها', athletes.length.toString()),
                  _buildStatTile(
                      'تعداد برنامه‌ها', 'N/A'), // بعداً با دیتا پر می‌شه
                  _buildStatTile('میانگین پیشرفت', 'N/A'), // نمونه
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('خطا: $e'),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () async {
                final backupUrl = await BackupService.backupDatabase();
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('بکاپ تهیه شد: $backupUrl')),
                );
              },
              child: const Text('تهیه بکاپ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        title: Text(title),
        trailing: Text(value,
            style: TextStyle(fontSize: 16.sp, color: AppColors.primary)),
      ),
    );
  }
}
