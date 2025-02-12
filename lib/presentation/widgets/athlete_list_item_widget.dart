import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../data/models/athlete_model.dart';
import '../providers/providers.dart';

class AthleteListItem extends ConsumerWidget {
  final Athlete athlete;
  final VoidCallback? onDelete;
  final VoidCallback? onDuplicate;

  const AthleteListItem({
    required this.athlete,
    this.onDelete,
    this.onDuplicate,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text('${athlete.firstName} ${athlete.lastName}'),
        subtitle: Text('سن: ${athlete.age} | هدف: ${athlete.goal}'),
        trailing: PopupMenuButton(
          itemBuilder: (_) => [
            const PopupMenuItem(value: 'edit', child: Text('ویرایش')),
            const PopupMenuItem(value: 'duplicate', child: Text('کپی')),
            const PopupMenuItem(value: 'delete', child: Text('حذف')),
          ],
          onSelected: (value) async {
            if (value == 'delete') {
              await ref
                  .read(athleteRepositoryProvider)
                  .deleteAthlete(athlete.id);
              // ignore: unused_result
              ref.refresh(athletesProvider);
              onDelete?.call(); // برداشتن فوکوس بعد از حذف
            } else if (value == 'duplicate') {
              final newAthlete = athlete.copyWith(id: Isar.autoIncrement);
              await ref.read(athleteRepositoryProvider).saveAthlete(newAthlete);
              // ignore: unused_result
              ref.refresh(athletesProvider);
              onDuplicate?.call(); // برداشتن فوکوس بعد از کپی
            }
          },
        ),
      ),
    );
  }
}
