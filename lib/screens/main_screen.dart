import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'workout_planner_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Map<String, String> _profileData = {};

  void _onProfileSubmit(Map<String, String> data) {
    setState(() {
      _profileData = data;
    });
  }

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
          ProfileScreen(onProfileSubmit: _onProfileSubmit),
          WorkoutPlannerScreen(profileData: _profileData),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'پروفایل',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'تمرین',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
