import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../data/models/workout_model.dart';

class AddWorkoutDialog extends StatefulWidget {
  final Function(WorkoutPlan) onSave;
  final int athleteId;
  final String day;

  const AddWorkoutDialog({
    required this.onSave,
    required this.athleteId,
    required this.day,
    super.key,
  });

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'افزودن تمرین به ${widget.day}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _exerciseNameController,
                decoration: const InputDecoration(
                  labelText: 'نام تمرین',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'لطفاً نام تمرین را وارد کنید' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _setsController,
                decoration: const InputDecoration(
                  labelText: 'تعداد ست‌ها',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'لطفاً تعداد ست‌ها را وارد کنید' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _repsController,
                decoration: const InputDecoration(
                  labelText: 'تعداد تکرارها',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'لطفاً تعداد تکرارها را وارد کنید' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _techniqueController,
                decoration: const InputDecoration(
                  labelText: 'تکنیک (اختیاری)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _saveWorkout,
                child: const Text('ذخیره تمرین'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveWorkout() {
    if (_formKey.currentState!.validate()) {
      final workout = WorkoutPlan(
        id: Isar.autoIncrement,
        athleteId: widget.athleteId, // استفاده از athleteId دریافتی
        day: widget.day, // استفاده از day دریافتی
        isRestDay: false,
        exercises: [
          WorkoutExercise(
            exerciseName: _exerciseNameController.text,
            sets: int.tryParse(_setsController.text),
            reps: int.tryParse(_repsController.text),
            technique: _techniqueController.text.isNotEmpty
                ? _techniqueController.text
                : null,
          ),
        ],
      );

      widget.onSave(workout);
      Navigator.pop(context);
    }
  }
}
