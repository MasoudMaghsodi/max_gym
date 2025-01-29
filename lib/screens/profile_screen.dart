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
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          // پس‌زمینه با لوگوی باشگاه
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Image.asset(
                'assets/image/max.png', // مسیر لوگو
                fit: BoxFit.cover,
              ),
            ),
          ),
          // محتوای اصلی فرم
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ProfileForm(
              key: _profileFormKey,
              onProfileSubmit: widget.onProfileSubmit, // ارسال اطلاعات پروفایل
            ),
          ),
        ],
      ),
    );
  }
}
