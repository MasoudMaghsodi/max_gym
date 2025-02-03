import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/dayModel/week_day_model.dart';

class DayCard extends ConsumerWidget {
  final WeekDay weekDay;
  final Function(bool)? onToggle;

  const DayCard({
    super.key,
    required this.weekDay,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8.0),
      color: weekDay.isActive ? Colors.blue[50] : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weekDay.persianName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: weekDay.isActive ? Colors.blue : Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            Switch(
              value: weekDay.isActive,
              activeColor: Colors.blue,
              onChanged: (value) {
                if (onToggle != null) {
                  onToggle!(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
