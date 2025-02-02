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
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _ageController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _goalController;
  late TextEditingController _coachNotesController;
  String? _selectedGender;

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
    _goalController = TextEditingController(text: widget.athlete?.goal ?? '');
    _coachNotesController =
        TextEditingController(text: widget.athlete?.coachNotes ?? '');
    _selectedGender = widget.athlete?.gender == Gender.male ? 'مرد' : 'زن';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _goalController.dispose();
    _coachNotesController.dispose();
    super.dispose();
  }

  void resetForm() {
    _formKey.currentState?.reset();
    _firstNameController.clear();
    _lastNameController.clear();
    _ageController.clear();
    _heightController.clear();
    _weightController.clear();
    _goalController.clear();
    _coachNotesController.clear();
    setState(() {
      _selectedGender = null;
    });
  }

  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  Map<String, String> collectFormData() {
    return {
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'age': _ageController.text,
      'height': _heightController.text,
      'weight': _weightController.text,
      'gender': _selectedGender ?? '',
      'goal': _goalController.text,
      'coachNotes': _coachNotesController.text,
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
