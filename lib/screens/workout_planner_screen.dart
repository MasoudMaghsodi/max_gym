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
    'جمعه': true, // جمعه به صورت پیش فرض تعطیل
  };

  @override
  void initState() {
    super.initState();
    _loadAllExercises();
  }

  Future<void> _loadAllExercises() async {
    await PreferencesManager.init();
    setState(() {
      _exercises['شنبه'] = PreferencesManager.getString('شنبه') ?? '';
      _exercises['یکشنبه'] = PreferencesManager.getString('یکشنبه') ?? '';
      _exercises['دوشنبه'] = PreferencesManager.getString('دوشنبه') ?? '';
      _exercises['سه‌شنبه'] = PreferencesManager.getString('سه‌شنبه') ?? '';
      _exercises['چهارشنبه'] = PreferencesManager.getString('چهارشنبه') ?? '';
      _exercises['پنج‌شنبه'] = PreferencesManager.getString('پنج‌شنبه') ?? '';
      _exercises['جمعه'] = PreferencesManager.getString('جمعه') ?? '';

      _restDays['شنبه'] =
          PreferencesManager.getString('شنبه_isRestDay') == 'true' ||
              _exercises['شنبه']!.isEmpty == false;
      _restDays['یکشنبه'] =
          PreferencesManager.getString('یکشنبه_isRestDay') == 'true' ||
              _exercises['یکشنبه']!.isEmpty == false;
      _restDays['دوشنبه'] =
          PreferencesManager.getString('دوشنبه_isRestDay') == 'true' ||
              _exercises['دوشنبه']!.isEmpty == false;
      _restDays['سه‌شنبه'] =
          PreferencesManager.getString('سه‌شنبه_isRestDay') == 'true' ||
              _exercises['سه‌شنبه']!.isEmpty == false;
      _restDays['چهارشنبه'] =
          PreferencesManager.getString('چهارشنبه_isRestDay') == 'true' ||
              _exercises['چهارشنبه']!.isEmpty == false;
      _restDays['پنج‌شنبه'] =
          PreferencesManager.getString('پنج‌شنبه_isRestDay') == 'true' ||
              _exercises['پنج‌شنبه']!.isEmpty == false;
      _restDays['جمعه'] =
          PreferencesManager.getString('جمعه_isRestDay') == 'true' ||
              _exercises['جمعه']!.isEmpty;
    });
  }

  void _toggleRestDay(String day) {
    setState(() {
      if (day != 'جمعه') {
        _restDays[day] = !_restDays[day]!;
        if (!_restDays[day]!) {
          _exercises[day] = PreferencesManager.getString(day) ?? '';
        } else {
          _exercises[day] = '';
          PreferencesManager.setString(day, '');
        }
        PreferencesManager.setString(
            '${day}_isRestDay', _restDays[day]!.toString());
      }
    });
  }

  Future<void> _resetAllExercises() async {
    await PreferencesManager.clear();
    await PreferencesManager
        .init(); // اطمینان از مقداردهی اولیه PreferencesManager پس از ریست
    setState(() {
      _exercises.forEach((key, value) {
        if (key != 'جمعه') {
          if (_restDays[key] == true) {
            _restDays[key] = false; // روزهای تعطیل را فعال می‌کند
            _exercises[key] = ''; // تمرینات روزهای تعطیل را ریست می‌کند
            PreferencesManager.setString(
                '${key}_isRestDay', 'false'); // ذخیره وضعیت فعال
          } else {
            _exercises[key] = PreferencesManager.getString(key) ??
                ''; // حفظ روزهای فعال و تمرینات آن‌ها
          }
        } else {
          _restDays[key] = true; // جمعه به صورت تعطیل باقی می‌ماند
          _exercises[key] = ''; // تمرینات جمعه را ریست می‌کند
          PreferencesManager.setString(
              '${key}_isRestDay', 'true'); // ذخیره وضعیت تعطیلی جمعه
        }
      });
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
        backgroundColor: Colors.blue[800], // تغییر رنگ به آبی تیره
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
            child: Image.asset(
              'assets/image/max.png', // استفاده از یک تصویر زمینه جدید و شیک
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black
                  .withValues(alpha: 0.1), // اضافه کردن شفافیت به تصویر زمینه
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
                        color: Colors.white.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.8)),
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
                                    color: Colors.black), // تغییر رنگ عنوان
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
