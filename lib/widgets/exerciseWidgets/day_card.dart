import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/dayModel/week_day_model.dart';

class WorkoutCard extends ConsumerWidget {
  final WeekDay weekDay;
  final Function(bool)? onToggle;

  const WorkoutCard({
    super.key,
    required this.weekDay,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: weekDay.isActive
          ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
          : Colors.grey[200],
      child: InkWell(
        onTap: () => onToggle?.call(!weekDay.isActive),
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  weekDay.persianName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: weekDay.isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black87,
                  ),
                ),
              ),
              Switch(
                value: weekDay.isActive,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {
                  if (onToggle != null) {
                    onToggle!(value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
