import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';

import '../../widgets/profileWidgets/profile_drapdown_widget.dart';
import '../../widgets/profileWidgets/profile_num_widget.dart';
import '../../widgets/profileWidgets/profile_textfiled_widget.dart';

class ProfileListView extends ConsumerStatefulWidget {
  final Athlete? athlete;
  const ProfileListView({super.key, this.athlete});

  @override
  ProfileListViewState createState() => ProfileListViewState();
}

class ProfileListViewState extends ConsumerState<ProfileListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _coachNotesController = TextEditingController();
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.athlete != null) {
      _firstNameController.text = widget.athlete!.firstName;
      _lastNameController.text = widget.athlete!.lastName;
      _ageController.text = widget.athlete!.age.toString();
      _weightController.text = widget.athlete!.weight.toStringAsFixed(1);
      _heightController.text = widget.athlete!.height.toStringAsFixed(1);
      _selectedGender = widget.athlete!.gender == Gender.male ? 'مرد' : 'زن';
      _goalController.text = widget.athlete!.goal ?? '';
      _coachNotesController.text = widget.athlete!.coachNotes ?? '';
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _goalController.dispose();
    _coachNotesController.dispose();
    super.dispose();
  }

  void resetForm() {
    _formKey.currentState?.reset();
    _firstNameController.clear();
    _lastNameController.clear();
    _ageController.clear();
    _weightController.clear();
    _heightController.clear();
    _goalController.clear();
    _coachNotesController.clear();
    setState(() => _selectedGender = null);
  }

  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  Map<String, String> collectFormData() {
    return {
      'firstName': _firstNameController.text.trim(),
      'lastName': _lastNameController.text.trim(),
      'age': _ageController.text.trim(),
      'weight': _weightController.text.trim(),
      'height': _heightController.text.trim(),
      'gender': _selectedGender ?? '',
      'goal': _goalController.text.trim(),
      'coachNotes': _coachNotesController.text.trim(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        children: [
          ProfileTextFieldWidget(
            controller: _firstNameController,
            label: "نام",
            icon: Icons.person,
            iconColor: Colors.indigo,
            customValidator: (value) => _validateRequiredField(value, 'نام'),
          ),
          SizedBox(height: 16.h),
          ProfileTextFieldWidget(
            controller: _lastNameController,
            label: "نام خانوادگی",
            icon: Icons.person_outline_outlined,
            iconColor: Colors.indigo,
            customValidator: (value) =>
                _validateRequiredField(value, 'نام خانوادگی'),
          ),
          SizedBox(height: 16.h),
          ProfileNumWidget(
            controller: _ageController,
            label: "سن",
            icon: Icons.cake_sharp,
            iconColor: Colors.green,
            validator: (value) => _validateNumericField(value, 'سن'),
          ),
          SizedBox(height: 16.h),
          ProfileNumWidget(
            controller: _heightController,
            label: "قد",
            icon: Icons.height_sharp,
            iconColor: Colors.orange,
            // decimal: true,
            validator: (value) => _validateNumericField(value, 'قد'),
          ),
          SizedBox(height: 16.h),
          ProfileNumWidget(
            controller: _weightController,
            label: "وزن",
            icon: Icons.scale_sharp,
            iconColor: Colors.red,
            // decimal: true,
            validator: (value) => _validateNumericField(value, 'وزن'),
          ),
          SizedBox(height: 16.h),
          ProfileDropdownWidget(
            label: "جنسیت",
            icon: Icons.person,
            items: const ["مرد", "زن"],
            required: true,
            onChanged: (value) => setState(() => _selectedGender = value),
            selectedItem: _selectedGender,
            color: Colors.blueAccent,
            validator: (value) =>
                value == null ? 'لطفا جنسیت را انتخاب کنید' : null,
          ),
          SizedBox(height: 16.h),
          ProfileTextFieldWidget(
            controller: _goalController,
            label: "هدف",
            icon: Icons.flag_circle_rounded,
            iconColor: Colors.teal,
            maxLines: 3,
          ),
          SizedBox(height: 16.h),
          ProfileTextFieldWidget(
            controller: _coachNotesController,
            label: "نظر مربی",
            icon: Icons.note_alt_outlined,
            iconColor: Colors.yellow.shade800,
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  String? _validateRequiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'لطفا $fieldName را وارد کنید';
    }
    return null;
  }

  String? _validateNumericField(String? value, String fieldName) {
    final error = _validateRequiredField(value, fieldName);
    if (error != null) return error;

    final number = double.tryParse(value!);
    if (number == null || number <= 0) {
      return 'مقدار $fieldName نامعتبر است';
    }
    return null;
  }
}
