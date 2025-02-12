import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../data/models/workout_model.dart';

class AddWorkoutDialog extends StatefulWidget {
  final Function(WorkoutPlan) onSave;

  const AddWorkoutDialog({required this.onSave, super.key});

  @override
  State<AddWorkoutDialog> createState() => _AddWorkoutDialogState();
}

class _AddWorkoutDialogState extends State<AddWorkoutDialog> {
  final _formKey = GlobalKey<FormState>();
  final _exerciseNameController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _techniqueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _exerciseNameController,
              decoration: const InputDecoration(labelText: 'نام تمرین'),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً نام تمرین را وارد کنید' : null,
            ),
            TextFormField(
              controller: _setsController,
              decoration: const InputDecoration(labelText: 'تعداد ست‌ها'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً تعداد ست‌ها را وارد کنید' : null,
            ),
            TextFormField(
              controller: _repsController,
              decoration: const InputDecoration(labelText: 'تعداد تکرارها'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً تعداد تکرارها را وارد کنید' : null,
            ),
            TextFormField(
              controller: _techniqueController,
              decoration: const InputDecoration(labelText: 'تکنیک'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveWorkout,
              child: const Text('ذخیره'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveWorkout() {
    if (_formKey.currentState!.validate()) {
      final workout = WorkoutPlan(
        id: Isar.autoIncrement,
        athleteId: 1, // باید از صفحه اصلی دریافت شود
        day: 'شنبه', // باید از تب‌ها دریافت شود
        isRestDay: false,
        exercises: [
          WorkoutExercise(
            exerciseName: _exerciseNameController.text,
            sets: int.tryParse(_setsController.text),
            reps: int.tryParse(_repsController.text),
            technique: _techniqueController.text,
          ),
        ],
      );

      widget.onSave(workout);
      Navigator.pop(context);
    }
  }
}
