import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'workout_planner_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // شاخص انتخاب‌شده برای صفحه
  int _selectedIndex = 0;
  // نقشه‌ای برای ذخیره داده‌های پروفایل
  Map<String, String> _profileData = {};

  // تابعی برای ارسال داده‌های پروفایل
  void _onProfileSubmit(Map<String, String> data) {
    setState(() {
      _profileData = data;
    });
  }

  // تابعی برای تغییر شاخص انتخاب‌شده
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ProfileScreen(
              onProfileSubmit: _onProfileSubmit), // نمایش صفحه پروفایل
          WorkoutPlannerScreen(
              profileData: _profileData), // نمایش صفحه برنامه تمرین
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'پروفایل', // برچسب پروفایل
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'تمرین', // برچسب تمرین
          ),
        ],
        currentIndex: _selectedIndex, // تنظیم شاخص انتخاب‌شده
        selectedItemColor: Colors.green[800], // رنگ آیتم انتخاب‌شده
        onTap: _onItemTapped, // فراخوانی تابع تغییر شاخص
      ),
    );
  }
}
