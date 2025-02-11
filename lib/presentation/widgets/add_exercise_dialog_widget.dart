import 'package:flutter/material.dart';

class AddExerciseDialog extends StatefulWidget {
  const AddExerciseDialog({super.key});

  @override
  State<AddExerciseDialog> createState() => _AddExerciseDialogState();
}

class _AddExerciseDialogState extends State<AddExerciseDialog> {
  String? exerciseType;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _setsController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  String? technique;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('افزودن تمرین'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: exerciseType,
              items: ['تمرین اصلی', 'سوپرست', 'تریست']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => exerciseType = value),
              decoration: const InputDecoration(labelText: 'نوع تمرین'),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'نام تمرین'),
            ),
            TextFormField(
              controller: _setsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'تعداد ست‌ها'),
            ),
            TextFormField(
              controller: _repsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'تعداد تکرارها'),
            ),
            DropdownButtonFormField<String>(
              value: technique,
              items: ['سوپرست', 'دروپ ست', 'استراحت-توقف']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => technique = value),
              decoration: const InputDecoration(labelText: 'تکنیک'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('لغو')),
        TextButton(onPressed: _saveExercise, child: const Text('ذخیره')),
      ],
    );
  }

  void _saveExercise() {
    // منطق ذخیره تمرین
  }
}
