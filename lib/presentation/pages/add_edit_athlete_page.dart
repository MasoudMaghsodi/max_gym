import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../core/constants/app_colors.dart';
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
  String _selectedGender = 'مرد';
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
      _selectedGender = widget.athlete!.gender;
      _goalController.text = widget.athlete!.goal;
      _coachNoteController.text = widget.athlete!.coachNote;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.athlete == null ? 'افزودن ورزشکار' : 'ویرایش ورزشکار',
            style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildPersonalInfoSection(),
              const SizedBox(height: 20),
              _buildPhysicalStatsSection(),
              const SizedBox(height: 20),
              _buildGoalsSection(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _saveAthlete,
                  child: const Text(
                    'ذخیره اطلاعات',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اطلاعات شخصی',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'نام',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً نام را وارد کنید' : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'نام خانوادگی',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً نام خانوادگی را وارد کنید' : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'سن',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) => _validateNumber(value, 'سن'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhysicalStatsSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مشخصات فیزیکی',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'قد (سانتی‌متر)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) => _validateNumber(value, 'قد'),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'وزن (کیلوگرم)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) => _validateNumber(value, 'وزن'),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              items: ['مرد', 'زن']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              decoration: InputDecoration(
                labelText: 'جنسیت',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => setState(() => _selectedGender = value!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalsSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'هدف و یادداشت',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _goalController,
              decoration: InputDecoration(
                labelText: 'هدف',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً هدف را وارد کنید' : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _coachNoteController,
              decoration: InputDecoration(
                labelText: 'یادداشت مربی',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignLabelWithHint: true,
              ),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
    );
  }

  String? _validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'لطفاً $fieldName را وارد کنید';
    }
    if (double.tryParse(value) == null) {
      return 'لطفاً عدد معتبر وارد کنید';
    }
    return null;
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
        gender: _selectedGender,
        goal: _goalController.text,
        coachNote: _coachNoteController.text,
      );

      try {
        await ref.read(athleteRepositoryProvider).saveAthlete(athlete);
        if (!mounted) return;
        Navigator.pop(context);
        // ignore: unused_result
        ref.refresh(athletesProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('اطلاعات با موفقیت ذخیره شد'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا در ذخیره اطلاعات: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
        debugPrint('Error saving athlete: $e');
      }
    }
  }
}
