import 'package:flutter/material.dart';
import '../../models/preferences_manager.dart';
import '../../models/exercise_data.dart';
import '../../models/workout_day.dart';
import '../models/workout_exercise.dart';
import '../widgets/day_card.dart';
import 'exercise_detail_screen.dart';

class ExerciseOverviewScreen extends StatefulWidget {
  const ExerciseOverviewScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExerciseOverviewScreenState createState() => _ExerciseOverviewScreenState();
}

class _ExerciseOverviewScreenState extends State<ExerciseOverviewScreen> {
  final Map<String, WorkoutDay> _days = {};

  @override
  void initState() {
    super.initState();
    _loadAllDays();
  }

  Future<void> _loadAllDays() async {
    await PreferencesManager.init();
    setState(() {
      _days['شنبه'] = _getWorkoutDay('شنبه');
      _days['یکشنبه'] = _getWorkoutDay('یکشنبه');
      _days['دوشنبه'] = _getWorkoutDay('دوشنبه');
      _days['سه‌شنبه'] = _getWorkoutDay('سه‌شنبه');
      _days['چهارشنبه'] = _getWorkoutDay('چهارشنبه');
      _days['پنج‌شنبه'] = _getWorkoutDay('پنج‌شنبه');
      _days['جمعه'] = _getWorkoutDay('جمعه');
    });
  }

  WorkoutDay _getWorkoutDay(String day) {
    final savedExercises = PreferencesManager.getString(day) ?? '';
    final savedCategories =
        PreferencesManager.getString('${day}_categories') ?? '';
    final categories = savedCategories.isNotEmpty
        ? savedCategories.split(',').map((category) => category).toList()
        : [];

    return WorkoutDay(
      dayName: day,
      categories: exerciseCategories
          .where((cat) => categories.contains(cat.name))
          .toList(),
      exercises: savedExercises.isNotEmpty
          ? savedExercises.split(',').map((e) {
              final parts = e.split('|');
              return WorkoutExercise(
                parts[0],
                int.parse(parts[1]),
                int.parse(parts[2]),
                technique: parts.length > 3 ? parts[3] : null,
                superSet: parts.length > 4 ? parts[4] : null,
                superSetReps: parts.length > 5 ? int.parse(parts[5]) : null,
                superSetTechnique: parts.length > 6 ? parts[6] : null,
                triSet: parts.length > 7 ? parts[7] : null,
                triSetReps: parts.length > 8 ? int.parse(parts[8]) : null,
                triSetTechnique: parts.length > 9 ? parts[9] : null,
              );
            }).toList()
          : [],
      isRestDay: savedExercises.isEmpty && savedCategories.isEmpty,
    );
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
        _days[day]?.categories = exerciseCategories
            .where((cat) => result['categories'].contains(cat.name))
            .toList();
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
              categories: exerciseCategories,
              onCategoryAdded: (category) {
                setState(() {
                  _days[dayName]?.categories.add(category);
                  PreferencesManager.setString(
                      dayName,
                      _days[dayName]
                              ?.categories
                              .map((cat) => cat.name)
                              .join(',') ??
                          '');
                });
              },
              onCategoryRemoved: (category) {
                setState(() {
                  _days[dayName]?.categories.remove(category);
                  PreferencesManager.setString(
                      dayName,
                      _days[dayName]
                              ?.categories
                              .map((cat) => cat.name)
                              .join(',') ??
                          '');
                });
              },
              onRestDayChanged: (isRestDay) {
                setState(() {
                  _days[dayName]?.isRestDay = isRestDay;
                  if (isRestDay) {
                    _days[dayName]?.categories.clear();
                    PreferencesManager.remove(dayName);
                  }
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
