import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../data/models/athlete_model.dart';
import '../providers/providers.dart';

class AddEditAthletePage extends ConsumerStatefulWidget {
  final Athlete? athlete;

  const AddEditAthletePage({this.athlete, super.key});

  @override
  ConsumerState<AddEditAthletePage> createState() => _AddEditAthletePageState();
}

class _AddEditAthletePageState extends ConsumerState<AddEditAthletePage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _genderController = TextEditingController();
  final _goalController = TextEditingController();
  final _coachNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.athlete != null) {
      _firstNameController.text = widget.athlete!.firstName;
      _lastNameController.text = widget.athlete!.lastName;
      _ageController.text = widget.athlete!.age.toString();
      _heightController.text = widget.athlete!.height.toString();
      _weightController.text = widget.athlete!.weight.toString();
      _genderController.text = widget.athlete!.gender;
      _goalController.text = widget.athlete!.goal;
      _coachNoteController.text = widget.athlete!.coachNote;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.athlete == null ? 'افزودن ورزشکار' : 'ویرایش ورزشکار'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildPersonalInfoSection(),
              _buildPhysicalStatsSection(),
              _buildGoalsSection(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveAthlete,
                child: const Text('ذخیره'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('اطلاعات شخصی',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(
          controller: _firstNameController,
          decoration: const InputDecoration(labelText: 'نام'),
          validator: (value) =>
              value!.isEmpty ? 'لطفاً نام را وارد کنید' : null,
        ),
        TextFormField(
          controller: _lastNameController,
          decoration: const InputDecoration(labelText: 'نام خانوادگی'),
          validator: (value) =>
              value!.isEmpty ? 'لطفاً نام خانوادگی را وارد کنید' : null,
        ),
        TextFormField(
          controller: _ageController,
          decoration: const InputDecoration(labelText: 'سن'),
          keyboardType: TextInputType.number,
          validator: (value) => value!.isEmpty ? 'لطفاً سن را وارد کنید' : null,
        ),
      ],
    );
  }

  Widget _buildPhysicalStatsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('مشخصات فیزیکی',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(
          controller: _heightController,
          decoration: const InputDecoration(labelText: 'قد (سانتی‌متر)'),
          keyboardType: TextInputType.number,
          validator: (value) => value!.isEmpty ? 'لطفاً قد را وارد کنید' : null,
        ),
        TextFormField(
          controller: _weightController,
          decoration: const InputDecoration(labelText: 'وزن (کیلوگرم)'),
          keyboardType: TextInputType.number,
          validator: (value) =>
              value!.isEmpty ? 'لطفاً وزن را وارد کنید' : null,
        ),
        TextFormField(
          controller: _genderController,
          decoration: const InputDecoration(labelText: 'جنسیت'),
          validator: (value) =>
              value!.isEmpty ? 'لطفاً جنسیت را وارد کنید' : null,
        ),
      ],
    );
  }

  Widget _buildGoalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('هدف و یادداشت',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(
          controller: _goalController,
          decoration: const InputDecoration(labelText: 'هدف'),
          validator: (value) =>
              value!.isEmpty ? 'لطفاً هدف را وارد کنید' : null,
        ),
        TextFormField(
          controller: _coachNoteController,
          decoration: const InputDecoration(labelText: 'یادداشت مربی'),
          maxLines: 3,
        ),
      ],
    );
  }

  void _saveAthlete() async {
    if (_formKey.currentState!.validate()) {
      final athlete = Athlete(
        id: widget.athlete?.id ?? Isar.autoIncrement,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        age: int.parse(_ageController.text),
        height: double.parse(_heightController.text),
        weight: double.parse(_weightController.text),
        gender: _genderController.text,
        goal: _goalController.text,
        coachNote: _coachNoteController.text,
      );

      try {
        await ref.read(athleteRepositoryProvider).saveAthlete(athlete);
        if (!mounted) return;
        Navigator.pop(context);
        // ignore: unused_result
        ref.refresh(athletesProvider);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطا در ذخیره ورزشکار: $e')),
        );
        debugPrint('Error saving athlete: $e');
      }
    }
  }
}
