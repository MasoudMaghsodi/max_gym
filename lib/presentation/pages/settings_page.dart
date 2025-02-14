import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backupService = ref.read(backupServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('تنظیمات'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('اکسپورت بکاپ'),
            leading: const Icon(Icons.backup),
            onTap: () async {
              await backupService
                  .exportToJson(context); // پاس دادن BuildContext
            },
          ),
          ListTile(
            title: const Text('ایمپورت بکاپ'),
            leading: const Icon(Icons.restore),
            onTap: () async {
              await backupService
                  .importFromJson(context); // پاس دادن BuildContext
            },
          ),
        ],
      ),
    );
  }
}
