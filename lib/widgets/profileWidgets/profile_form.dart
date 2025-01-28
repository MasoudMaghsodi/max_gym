import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  // تابعی برای ارسال اطلاعات پروفایل
  final Function(Map<String, String>) onProfileSubmit;

  const ProfileForm({super.key, required this.onProfileSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  // کلید فرم برای دسترسی به وضعیت فرم
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // کنترلرهای متنی برای فیلدهای فرم
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _shortTermGoalController =
      TextEditingController();
  final TextEditingController _longTermGoalController = TextEditingController();
  final TextEditingController _coachNotesController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final profileData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'age': _ageController.text,
        'gender': _genderController.text,
        'height': _heightController.text,
        'weight': _weightController.text,
        'shortTermGoal': _shortTermGoalController.text,
        'longTermGoal': _longTermGoalController.text,
        'coachNotes': _coachNotesController.text,
      };
      widget.onProfileSubmit(profileData);
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _firstNameController.clear();
    _lastNameController.clear();
    _ageController.clear();
    _genderController.clear();
    _heightController.clear();
    _weightController.clear();
    _shortTermGoalController.clear();
    _longTermGoalController.clear();
    _coachNotesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'نام'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'این فیلد نمی‌تواند خالی باشد';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'نام خانوادگی'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'این فیلد نمی‌تواند خالی باشد';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'سن'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'این فیلد نمی‌تواند خالی باشد';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _genderController,
            decoration: InputDecoration(labelText: 'جنسیت'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'این فیلد نمی‌تواند خالی باشد';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _heightController,
            decoration: InputDecoration(labelText: 'قد (سانتی‌متر)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'این فیلد نمی‌تواند خالی باشد';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _weightController,
            decoration: InputDecoration(labelText: 'وزن (کیلوگرم)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'این فیلد نمی‌تواند خالی باشد';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _shortTermGoalController,
            decoration: InputDecoration(labelText: 'هدف کوتاه‌مدت'),
          ),
          TextFormField(
            controller: _longTermGoalController,
            decoration: InputDecoration(labelText: 'هدف بلند‌مدت'),
          ),
          TextFormField(
            controller: _coachNotesController,
            decoration: InputDecoration(labelText: 'یادداشت‌های مربی'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('ثبت پروفایل'),
          ),
          ElevatedButton(
            onPressed: _resetForm,
            child: Text('ریست فرم'),
          ),
        ],
      ),
    );
  }
}
