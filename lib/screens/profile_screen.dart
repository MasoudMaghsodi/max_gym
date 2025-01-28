import 'package:flutter/material.dart';
import '../widgets/profileWidgets/profile_form.dart';

class ProfileScreen extends StatefulWidget {
  // تابعی برای ارسال اطلاعات پروفایل
  final Function(Map<String, String>) onProfileSubmit;

  const ProfileScreen({super.key, required this.onProfileSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // کلید فرم پروفایل برای دسترسی به وضعیت فرم
  final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();

  // ریست کردن اطلاعات پروفایل
  void _resetProfile() {
    _profileFormKey.currentState?.reset();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
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
        title: const Text(
          'پروفایل ورزشکار',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
            onPressed: _resetProfile, // فراخوانی تابع ریست پروفایل
            tooltip: 'ریست کردن اطلاعات پروفایل',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0), // تنظیم انحنای تصویر
              child: Image.asset(
                'assets/image/max.png',
                fit: BoxFit.fill,
                width: 40.0,
                height: 40.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // فاصله داخلی اسکرول ویو
        child: ProfileForm(
          key: _profileFormKey,
          onProfileSubmit: widget.onProfileSubmit, // ارسال اطلاعات پروفایل
        ),
      ),
    );
  }
}
