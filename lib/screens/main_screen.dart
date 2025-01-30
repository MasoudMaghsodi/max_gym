import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/profile_provider.dart';
import '../providers/workout_provider.dart';
import 'profile_screen.dart';
import 'workout_planner_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _selectedIndex =
      0; // تعریف متغیر _selectedIndex برای نگهداری شاخص انتخاب‌شده

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // بروزرسانی شاخص انتخاب‌شده
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileData = ref.watch(profileProvider);
    final workoutDays = ref.watch(workoutProvider);

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ProfileScreen(), // نمایش صفحه پروفایل
          WorkoutPlannerScreen(
              profileData: profileData,
              workoutDays: workoutDays), // نمایش صفحه برنامه تمرین
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
