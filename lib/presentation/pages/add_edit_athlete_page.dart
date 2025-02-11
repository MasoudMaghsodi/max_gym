import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/athlete_model.dart';
import '../../presentation/providers/providers.dart';

class AddEditAthletePage extends ConsumerStatefulWidget {
  final Athlete? athlete;

  const AddEditAthletePage({this.athlete, super.key});

  @override
  ConsumerState<AddEditAthletePage> createState() => _AddEditAthletePageState();
}

class _AddEditAthletePageState extends ConsumerState<AddEditAthletePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _ageController;
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  late final TextEditingController _genderController;
  late final TextEditingController _goalController;
  late final TextEditingController _coachNoteController;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.athlete?.firstName ?? '');
    _lastNameController =
        TextEditingController(text: widget.athlete?.lastName ?? '');
    _ageController =
        TextEditingController(text: widget.athlete?.age.toString() ?? '');
    _heightController =
        TextEditingController(text: widget.athlete?.height.toString() ?? '');
    _weightController =
        TextEditingController(text: widget.athlete?.weight.toString() ?? '');
    _genderController =
        TextEditingController(text: widget.athlete?.gender ?? '');
    _goalController = TextEditingController(text: widget.athlete?.goal ?? '');
    _coachNoteController =
        TextEditingController(text: widget.athlete?.coachNote ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _genderController.dispose();
    _goalController.dispose();
    _coachNoteController.dispose();
    super.dispose();
  }

  Future<void> _saveAthlete() async {
    if (_formKey.currentState!.validate()) {
      final athlete = Athlete(
        // id: widget.athlete?.id ?? Isar.autoIncrement,
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
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطا در ذخیره ورزشکار: $e')),
        );
        debugPrint('خطا در ذخیره ورزشکار: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.athlete == null ? 'افزودن ورزشکار' : 'ویرایش ورزشکار'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveAthlete,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
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
                validator: (value) =>
                    value!.isEmpty ? 'لطفاً سن را وارد کنید' : null,
              ),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'قد (سانتی‌متر)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'لطفاً قد را وارد کنید' : null,
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
          ),
        ),
      ),
    );
  }
}
