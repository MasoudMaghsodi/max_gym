import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/widgets/profileWidgets/profile_drapdown_widget.dart';
import 'package:max_gym/widgets/profileWidgets/profile_num_widget.dart';

import '../../widgets/profileWidgets/profile_textfiled_widget.dart';

// ignore: must_be_immutable
class ProfileListView extends ConsumerStatefulWidget {
  const ProfileListView({super.key});
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
  void dispose() {
    // حتماً کنترلرها را در dispose پاکسازی کنید
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
    setState(() {
      _selectedGender = null; // ریست جنسیت
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
      'weight': _weightController.text,
      'height': _heightController.text,
      'gender': _selectedGender ?? '',
      'goal': _goalController.text,
      'coachNotes': _coachNotesController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          profileTextFieldWidgeet(
            controller: _firstNameController,
            label: "نام",
            icon: Icons.person,
            iconColor: Colors.indigo,
            required: true,
          ),
          SizedBox(height: 16.h),
          profileTextFieldWidgeet(
            controller: _lastNameController,
            label: "نام خانوادگی",
            icon: Icons.person_outline_outlined,
            iconColor: Colors.indigo,
            required: true,
          ),
          SizedBox(height: 16.h),
          profileNumWidget(
            controller: _ageController,
            label: "سن",
            icon: Icons.cake_sharp,
            iconColor: Colors.green,
            required: true,
          ),
          SizedBox(height: 16.h),
          profileNumWidget(
            controller: _heightController,
            label: "قد",
            icon: Icons.height_sharp,
            iconColor: Colors.orange,
            required: true,
          ),
          SizedBox(height: 16.h),
          profileNumWidget(
            controller: _weightController,
            label: "وزن",
            icon: Icons.scale_sharp,
            iconColor: Colors.red,
            required: true,
          ),
          SizedBox(height: 16.h),
          profileDropdownWidget(
            label: "جنسیت",
            icon: Icons.person,
            items: ["مرد", "زن"],
            required: true,
            onChanged: (value) {
              _selectedGender = value;
            },
            selectedItem: _selectedGender,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 16.h),
          profileTextFieldWidgeet(
            controller: _goalController,
            label: "هدف",
            icon: Icons.flag_circle_rounded,
            iconColor: Colors.teal,
          ),
          SizedBox(height: 16.h),
          profileTextFieldWidgeet(
            controller: _coachNotesController,
            label: "نظر مربی",
            icon: Icons.note_alt_outlined,
            iconColor: Colors.yellow.shade800,
          ),
        ],
      ),
    );
  }
}
