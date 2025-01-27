import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ProfileForm extends StatefulWidget {
  final Function(Map<String, String>) onProfileSubmit;

  const ProfileForm({super.key, required this.onProfileSubmit});

  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _profileData = <String, String>{};
  final _scrollController = ScrollController();

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: Duration(seconds: 3),
      ),
    );
  }

  String getCurrentShamsiDate() {
    final now = Jalali.now();
    return '${now.year}/${now.month}/${now.day}';
  }

  void resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _profileData.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildTextField('نام', 'firstName'),
            _buildTextField('نام خانوادگی', 'lastName'),
            _buildTextField('سن', 'age',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            _buildTextField('جنسیت', 'gender'),
            _buildTextField('قد (سانتی‌متر)', 'height',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            _buildTextField('وزن (کیلوگرم)', 'weight',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            _buildTextField('هدف کوتاه‌مدت', 'shortTermGoal'),
            _buildTextField('هدف بلند‌مدت', 'longTermGoal'),
            _buildTextField('یادداشت‌های مربی', 'coachNotes', maxLines: 3),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _profileData['date'] = getCurrentShamsiDate();
                  widget.onProfileSubmit(_profileData);
                  _showSnackBar('اطلاعات با موفقیت ذخیره شد', Colors.green);
                } else {
                  _showSnackBar('لطفاً تمامی موارد را کامل کنید', Colors.red);
                }
              },
              child: Text('ذخیره'),
            ),
            SizedBox(height: 20),
            if (_profileData.isNotEmpty) ...[
              Text(
                'اطلاعات ذخیره شده:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ..._profileData.entries.map((entry) {
                return Text('${entry.key}: ${entry.value}');
              }),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String key,
      {TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters,
      int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'لطفاً $label را وارد کنید';
          }
          return null;
        },
        onSaved: (value) {
          _profileData[key] = value!;
        },
      ),
    );
  }
}
