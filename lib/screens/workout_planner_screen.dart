import 'package:flutter/material.dart';
import 'dart:ui'; // اضافه کردن این import برای ImageFilter.blur
import '../widgets/exerciseWidgets/exercise_card.dart';
import '../../models/preferences_manager.dart';

class WorkoutPlannerScreen extends StatefulWidget {
  const WorkoutPlannerScreen({super.key, required this.profileData});

  final Map<String, String> profileData;

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutPlannerScreenState createState() => _WorkoutPlannerScreenState();
}

class _WorkoutPlannerScreenState extends State<WorkoutPlannerScreen> {
  final Map<String, String> _exercises = {};
  final Map<String, bool> _restDays = {
    'شنبه': false,
    'یکشنبه': false,
    'دوشنبه': false,
    'سه‌شنبه': false,
    'چهارشنبه': false,
    'پنج‌شنبه': false,
    'جمعه': true, // جمعه به صورت پیش‌فرض تعطیل
  };

  @override
  void initState() {
    super.initState();
    _loadAllExercises();
  }

  Future<void> _loadAllExercises() async {
    await PreferencesManager.init();
    setState(() {
      for (var day in _restDays.keys) {
        _exercises[day] = PreferencesManager.getString(day) ?? '';
        _restDays[day] = day == 'جمعه' ? true : false;
      }
    });
  }

  void _toggleRestDay(String day) {
    if (day == 'جمعه') return;
    setState(() {
      _restDays[day] = !_restDays[day]!;
      if (_restDays[day]!) {
        _exercises[day] = '';
        PreferencesManager.setString(day, '');
      } else {
        _exercises[day] = PreferencesManager.getString(day) ?? '';
      }
      PreferencesManager.setString(
          '${day}_isRestDay', _restDays[day]!.toString());
    });
  }

  Future<void> _resetAllExercises() async {
    await PreferencesManager.clear();
    await PreferencesManager.init();
    setState(() {
      for (var day in _restDays.keys) {
        _restDays[day] = day == 'جمعه';
        _exercises[day] = '';
        PreferencesManager.setString(
            '${day}_isRestDay', _restDays[day]!.toString());
      }
    });
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تمامی داده‌های تمرینات ریست شدند'),
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامه تمرینات هفتگی'),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetAllExercises,
            tooltip: 'ریست کردن تمامی تمرینات',
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Image.asset(
                'assets/image/max.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: _exercises.keys.map((day) {
              final exercises = _exercises[day]!;
              final isRestDay = _restDays[day]!;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(150),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.white.withAlpha(200)),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                day,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isRestDay
                                      ? Colors.redAccent
                                      : Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                onPressed: () => _toggleRestDay(day),
                                child: Text(
                                  isRestDay ? 'روز تعطیل' : 'فعال',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          if (isRestDay)
                            const Text('امروز روز تعطیل است',
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 16)),
                          if (!isRestDay)
                            ExerciseCard(day: day, exercises: exercises),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
