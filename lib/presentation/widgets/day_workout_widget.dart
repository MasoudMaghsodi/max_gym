import 'package:flutter/material.dart';
import 'package:max_gym/data/models/workout_model.dart';

class DayWorkoutCard extends StatelessWidget {
  final WorkoutPlan dayPlan;

  const DayWorkoutCard({required this.dayPlan, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(dayPlan.day),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _deleteDay(context),
      ),
      children: [
        if (dayPlan.isRestDay)
          const ListTile(title: Text('روز استراحت'))
        else
          ...dayPlan.workoutCards
              .map((card) => WorkoutCardItem(card: card))
              .toList(),
        ElevatedButton(
            onPressed: () => _editWorkout(context),
            child: const Text('ویرایش تمرینات')),
      ],
    );
  }
}

class WorkoutCardItem extends StatelessWidget {
  final WorkoutCard card;

  const WorkoutCardItem({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(card.exerciseName ?? 'بدون نام'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (card.sets != null) Text('ست‌ها: ${card.sets}'),
            if (card.reps != null) Text('تکرارها: ${card.reps}'),
            if (card.technique != null) Text('تکنیک: ${card.technique}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => _editWorkoutCard(context, card),
        ),
      ),
    );
  }

  void _editWorkoutCard(BuildContext context, WorkoutCard card) {
    // منطق ویرایش کارت تمرین
  }
}

void _editWorkout(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('ویرایش برنامه تمرینی', style: TextStyle(fontSize: 20)),
          Expanded(
            child: ListView(
              children: [
                // افزودن فیلدهای ویرایش برنامه تمرینی
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // ذخیره تغییرات
              Navigator.pop(context);
            },
            child: const Text('ذخیره'),
          ),
        ],
      ),
    ),
  );
}

void _deleteDay(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('حذف روز تمرینی'),
      content: const Text('آیا مطمئن هستید که می‌خواهید این روز را حذف کنید؟'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('لغو'),
        ),
        TextButton(
          onPressed: () {
            // منطق حذف روز تمرینی
            Navigator.pop(context);
          },
          child: const Text('حذف'),
        ),
      ],
    ),
  );
}
