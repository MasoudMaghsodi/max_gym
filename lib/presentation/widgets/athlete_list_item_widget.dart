import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../data/models/athlete_model.dart';
import '../pages/add_edit_athlete_page.dart';
import '../pages/workout_plan_page.dart';
import '../providers/providers.dart';

class AthleteListItem extends ConsumerWidget {
  final Athlete athlete;

  const AthleteListItem({required this.athlete, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        title: Text('${athlete.firstName} ${athlete.lastName}'),
        subtitle: Text('سن: ${athlete.age} | هدف: ${athlete.goal}'),
        trailing: PopupMenuButton(
          itemBuilder: (_) => [
            const PopupMenuItem(value: 'edit', child: Text('ویرایش')),
            const PopupMenuItem(value: 'duplicate', child: Text('داپلیکیت')),
            const PopupMenuItem(value: 'delete', child: Text('حذف')),
          ],
          onSelected: (value) async {
            if (value == 'delete') {
              await ref
                  .read(athleteRepositoryProvider)
                  .deleteAthlete(athlete.id);
              // ignore: unused_result
              ref.refresh(athletesProvider);
            } else if (value == 'edit') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddEditAthletePage(athlete: athlete)));
            } else if (value == 'duplicate') {
              final newAthlete = athlete.copyWith(id: Isar.autoIncrement);
              await ref.read(athleteRepositoryProvider).saveAthlete(newAthlete);
              // ignore: unused_result
              ref.refresh(athletesProvider);
            }
          },
        ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => WorkoutPlanPage(athleteId: athlete.id)),
            ));
  }
}
