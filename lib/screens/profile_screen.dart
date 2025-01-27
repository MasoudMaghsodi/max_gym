import 'package:flutter/material.dart';
import '../widgets/profile_form.dart';

class ProfileScreen extends StatefulWidget {
  final Function(Map<String, String>) onProfileSubmit;

  const ProfileScreen({super.key, required this.onProfileSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ProfileFormState> _profileFormKey =
      GlobalKey<ProfileFormState>();

  void _resetProfile() {
    _profileFormKey.currentState?.resetForm();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('اطلاعات پروفایل ریست شدند'),
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('پروفایل ورزشکار'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetProfile,
            tooltip: 'ریست کردن اطلاعات پروفایل',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ProfileForm(
          key: _profileFormKey,
          onProfileSubmit: widget.onProfileSubmit,
        ),
      ),
    );
  }
}
