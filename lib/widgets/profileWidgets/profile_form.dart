import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  // تابعی برای ارسال اطلاعات پروفایل
  final Function(Map<String, String>) onProfileSubmit;

  const ProfileForm({super.key, required this.onProfileSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm>
    with SingleTickerProviderStateMixin {
  // کلید فرم برای دسترسی به وضعیت فرم
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // کنترلرهای متنی برای فیلدهای فرم
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _coachNotesController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final profileData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'age': _ageController.text,
        'gender': _genderController.text,
        'height': _heightController.text,
        'weight': _weightController.text,
        'goal': _goalController.text,
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
    _goalController.clear();
    _coachNotesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Icon(Icons.person, size: 80, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'اطلاعات شخصی',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 32, color: Colors.blue),
            _buildTextField(
              controller: _firstNameController,
              label: 'نام',
              icon: Icons.account_circle,
              iconColor: Colors.green,
            ),
            _buildTextField(
              controller: _lastNameController,
              label: 'نام خانوادگی',
              icon: Icons.account_circle_outlined,
              iconColor: Colors.orange,
            ),
            _buildTextField(
              controller: _ageController,
              label: 'سن',
              icon: Icons.cake,
              iconColor: Colors.purple,
              keyboardType: TextInputType.number,
            ),
            _buildDropdownField(
              controller: _genderController,
              label: 'جنسیت',
              items: ['مرد', 'زن'],
              iconColor: Colors.pink,
            ),
            _buildTextField(
              controller: _heightController,
              label: 'قد (سانتی‌متر)',
              icon: Icons.height,
              iconColor: Colors.teal,
              keyboardType: TextInputType.number,
            ),
            _buildTextField(
              controller: _weightController,
              label: 'وزن (کیلوگرم)',
              icon: Icons.fitness_center,
              iconColor: Colors.red,
              keyboardType: TextInputType.number,
            ),
            const Divider(height: 32, color: Colors.blue),
            const Text(
              'اطلاعات هدف و مربی',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildTextField(
              controller: _goalController,
              label: 'هدف',
              icon: Icons.flag,
              iconColor: Colors.indigo,
            ),
            _buildTextField(
              controller: _coachNotesController,
              label: 'یادداشت‌های مربی',
              icon: Icons.note,
              iconColor: Colors.brown,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('ثبت پروفایل'),
                ),
                ElevatedButton(
                  onPressed: _resetForm,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('ریست فرم'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color iconColor,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: iconColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'این فیلد نمی‌تواند خالی باشد';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField({
    required TextEditingController controller,
    required String label,
    required List<String> items,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: controller.text.isNotEmpty ? controller.text : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(Icons.transgender, color: iconColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            controller.text = value ?? '';
          });
        },
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'این فیلد نمی‌تواند خالی باشد';
          }
          return null;
        },
      ),
    );
  }
}
