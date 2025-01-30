import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileForm extends ConsumerStatefulWidget {
  const ProfileForm({super.key});

  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends ConsumerState<ProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // کنترلرهای متنی برای فیلدهای فرم
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _coachNotesController = TextEditingController();

  String? _selectedGender; // پیش‌فرض جنسیت خالی است

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
          _buildPersianTextField(_firstNameController, 'نام', Icons.person,
              color: Colors.indigo, required: true),
          const SizedBox(height: 16),
          _buildPersianTextField(
              _lastNameController, 'نام خانوادگی', Icons.person_outline,
              color: Colors.indigo, required: true),
          const SizedBox(height: 16),
          _buildNumberField(_ageController, 'سن', Icons.cake,
              color: Colors.green, required: true),
          const SizedBox(height: 16),
          _buildNumberField(_weightController, 'وزن', Icons.scale,
              color: Colors.red, required: true),
          const SizedBox(height: 16),
          _buildNumberField(_heightController, 'قد', Icons.height,
              color: Colors.orange, required: true),
          const SizedBox(height: 16),
          _buildDropdownField('جنسیت', Icons.wc,
              color: Colors.purple, required: true),
          const SizedBox(height: 16),
          _buildPersianTextField(_goalController, 'هدف', Icons.flag,
              color: Colors.teal, maxLines: 1),
          const SizedBox(height: 16),
          _buildPersianTextField(_coachNotesController, 'نظر مربی', Icons.note,
              color: Colors.yellow, maxLines: 4),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPersianTextField(
      TextEditingController controller, String label, IconData icon,
      {Color color = Colors.black, int maxLines = 1, bool required = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(icon, color: color),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.8),
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[ا-ی\s]')),
      ],
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      validator: required
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'لطفاً $label خود را وارد کنید';
              }
              if (!RegExp(r'^[ا-ی\s]+$').hasMatch(value)) {
                return 'لطفاً فقط حروف فارسی وارد کنید';
              }
              return null;
            }
          : null,
    );
  }

  Widget _buildNumberField(
      TextEditingController controller, String label, IconData icon,
      {Color color = Colors.black, bool required = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(icon, color: color),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.8),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: required
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'لطفاً $label خود را وارد کنید';
              }
              if (!RegExp(r'^\d+$').hasMatch(value)) {
                return 'لطفاً فقط عدد وارد کنید';
              }
              return null;
            }
          : null,
    );
  }

  Widget _buildDropdownField(String label, IconData icon,
      {Color color = Colors.black, bool required = false}) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(icon, color: color),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedGender,
          hint: Text('جنسیت'),
          isDense: true,
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
          items: ['مرد', 'زن'].map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
