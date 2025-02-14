import 'package:flutter/material.dart';
import 'package:max_gym/core/constants/app_colors.dart';

class AddExerciseDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  const AddExerciseDialog({required this.onSave, super.key});

  @override
  State<AddExerciseDialog> createState() => _AddExerciseDialogState();
}

class _AddExerciseDialogState extends State<AddExerciseDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _exerciseType = 'تمرین اصلی';
  final _nameController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  String? _technique;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Center(
        child: Text(
          'افزودن تمرین جدید',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTypeDropdown(),
              const SizedBox(height: 15),
              _buildNameField(),
              const SizedBox(height: 15),
              _buildSetsField(),
              const SizedBox(height: 15),
              _buildRepsField(),
              const SizedBox(height: 15),
              _buildTechniqueDropdown(),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('لغو', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: _saveExercise,
          child: const Text('ذخیره تمرین'),
        ),
      ],
    );
  }

  Widget _buildTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: _exerciseType,
      items: ['تمرین اصلی', 'سوپرست', 'تریست']
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) => setState(() => _exerciseType = value),
      decoration: InputDecoration(
        labelText: 'نوع تمرین',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) =>
          value == null ? 'لطفاً نوع تمرین را انتخاب کنید' : null,
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'نام تمرین',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) =>
          value!.isEmpty ? 'لطفاً نام تمرین را وارد کنید' : null,
    );
  }

  Widget _buildSetsField() {
    return TextFormField(
      controller: _setsController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'تعداد ست‌ها',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) => _validateNumber(value, 'ست‌ها'),
    );
  }

  Widget _buildRepsField() {
    return TextFormField(
      controller: _repsController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'تعداد تکرارها',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) => _validateNumber(value, 'تکرارها'),
    );
  }

  Widget _buildTechniqueDropdown() {
    return DropdownButtonFormField<String>(
      value: _technique,
      items: ['سوپرست', 'دروپ ست', 'استراحت-توقف', 'بدون تکنیک']
          .map(
            (e) => DropdownMenuItem(
              value: e == 'بدون تکنیک' ? null : e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (value) => setState(() => _technique = value),
      decoration: InputDecoration(
        labelText: 'تکنیک (اختیاری)',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  String? _validateNumber(String? value, String field) {
    if (value == null || value.isEmpty) {
      return 'لطفاً تعداد $field را وارد کنید';
    }
    if (int.tryParse(value) == null) {
      return 'لطفاً عدد معتبر وارد کنید';
    }
    return null;
  }

  void _saveExercise() {
    if (_formKey.currentState!.validate()) {
      final exerciseData = {
        'type': _exerciseType,
        'name': _nameController.text,
        'sets': int.parse(_setsController.text),
        'reps': int.parse(_repsController.text),
        'technique': _technique,
      };

      widget.onSave(exerciseData);
      Navigator.pop(context);
    }
  }
}
