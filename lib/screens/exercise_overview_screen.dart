// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/workout_day.dart';
import '../widgets/day_card.dart';
import '../providers/workout_provider.dart';
import 'exercise_detail_screen.dart';

class ExerciseOverviewScreen extends ConsumerStatefulWidget {
  const ExerciseOverviewScreen({super.key});

  @override
  _ExerciseOverviewScreenState createState() => _ExerciseOverviewScreenState();
}

class _ExerciseOverviewScreenState
    extends ConsumerState<ExerciseOverviewScreen> {
  @override
  void initState() {
    super.initState();
    _loadAllDays();
  }

  final Map<String, WorkoutDay> _days = {};

  Future<void> _loadAllDays() async {
    setState(() {
      for (var day in [
        'شنبه',
        'یکشنبه',
        'دوشنبه',
        'سه‌شنبه',
        'چهارشنبه',
        'پنج‌شنبه',
        'جمعه'
      ]) {
        _days[day] = ref.read(workoutProvider.notifier).getWorkoutDay(day);
      }
    });
  }

  Future<void> _navigateToDetailScreen(String day) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseDetailScreen(day: day),
      ),
    );

    if (result != null && result.containsKey('categories')) {
      setState(() {
        _days[day]?.categories = result['categories'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامه تمرینات هفتگی'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadAllDays,
            tooltip: 'بارگذاری دوباره تمرینات',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: _days.entries.map((entry) {
          final dayName = entry.key;
          final workoutDay = entry.value;

          return GestureDetector(
            onTap: () => _navigateToDetailScreen(dayName),
            child: DayCard(
              day: workoutDay,
              categories: workoutDay.categories,
              onCategoryAdded: (category) {
                setState(() {
                  _days[dayName]?.categories.add(category);
                });
              },
              onCategoryRemoved: (category) {
                setState(() {
                  _days[dayName]?.categories.remove(category);
                });
              },
              onRestDayChanged: (isRestDay) {
                setState(() {
                  _days[dayName]?.isRestDay = isRestDay;
                });
              },
              onAddExercise: () {},
            ),
          );
        }).toList(),
      ),
    );
  }
}
