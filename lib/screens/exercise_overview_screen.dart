import 'package:flutter/material.dart';
import '../widgets/exerciseWidgets/exercise_card.dart';
import '../../models/preferences_manager.dart';

class ExerciseOverviewScreen extends StatefulWidget {
  const ExerciseOverviewScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExerciseOverviewScreenState createState() => _ExerciseOverviewScreenState();
}

class _ExerciseOverviewScreenState extends State<ExerciseOverviewScreen> {
  // نقشه‌ای برای ذخیره تمرینات هر روز
  final Map<String, String> _exercises = {};

  @override
  void initState() {
    super.initState();
    _loadAllExercises();
  }

  // بارگذاری تمامی تمرینات ذخیره‌شده
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
    });
  }

  // به‌روزرسانی تمرینات در نقشه
  void _refreshExercises() {
    setState(() {
      _loadAllExercises();
    });
  }

  // ریست کردن تمامی تمرینات ذخیره‌شده
  Future<void> _resetAllExercises() async {
    await PreferencesManager.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تمامی داده‌های تمرینات ریست شدند'),
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 3),
      ),
    );
    _refreshExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامه تمرینات هفتگی'), // عنوان صفحه
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetAllExercises, // ریست کردن تمامی تمرینات
            tooltip: 'ریست کردن تمامی تمرینات',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0), // فاصله داخلی لیست
        children: [
          ExerciseCard(day: 'شنبه', exercises: _exercises['شنبه'] ?? ''),
          ExerciseCard(day: 'یکشنبه', exercises: _exercises['یکشنبه'] ?? ''),
          ExerciseCard(day: 'دوشنبه', exercises: _exercises['دوشنبه'] ?? ''),
          ExerciseCard(day: 'سه‌شنبه', exercises: _exercises['سه‌شنبه'] ?? ''),
          ExerciseCard(
              day: 'چهارشنبه', exercises: _exercises['چهارشنبه'] ?? ''),
          ExerciseCard(
              day: 'پنج‌شنبه', exercises: _exercises['پنج‌شنبه'] ?? ''),
          ExerciseCard(day: 'جمعه', exercises: _exercises['جمعه'] ?? ''),
        ],
      ),
    );
  }
}
