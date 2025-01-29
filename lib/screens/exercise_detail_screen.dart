import 'package:flutter/material.dart';
import '../../models/workout_exercise.dart';
import '../widgets/exerciseWidgets/exercise_row.dart';
import '../../models/preferences_manager.dart';
import '../../models/exercise_data.dart';
import '../../models/training_technique.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final String day;

  const ExerciseDetailScreen({super.key, required this.day});

  @override
  // ignore: library_private_types_in_public_api
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  List<WorkoutExercise> _exercises = List.generate(
    8,
    (index) => WorkoutExercise('', 0, 0),
  );
  List<String> selectedCategories = [];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    final savedExercises = PreferencesManager.getString(widget.day) ?? '';
    final savedCategories =
        PreferencesManager.getString('${widget.day}_categories') ?? '';
    setState(() {
      _exercises = savedExercises.split(',').map((e) {
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
      }).toList();

      selectedCategories =
          savedCategories.isNotEmpty ? savedCategories.split(',') : [];
    });
  }

  Future<void> _saveExercises() async {
    await PreferencesManager.setString(
      widget.day,
      _exercises
          .map((e) =>
              '${e.name}|${e.sets}|${e.reps}|${e.technique ?? ''}|${e.superSet ?? ''}|${e.superSetReps ?? ''}|${e.superSetTechnique ?? ''}|${e.triSet ?? ''}|${e.triSetReps ?? ''}|${e.triSetTechnique ?? ''}')
          .join(','),
    );

    await PreferencesManager.setString(
      '${widget.day}_categories',
      selectedCategories.join(','),
    );
  }

  void _updateExercise(int index, WorkoutExercise updatedExercise) {
    setState(() {
      _exercises[index] = updatedExercise;
    });
    _saveExercises();
  }

  void _resetDay() async {
    await PreferencesManager.remove(widget.day);
    await PreferencesManager.remove('${widget.day}_categories');
    setState(() {
      _exercises = List.generate(
        8,
        (index) => WorkoutExercise('', 0, 0),
      );
      selectedCategories = [];
      dropdownValue = null;
    });
  }

  List<String> _getExercisesForSelectedCategories() {
    return exerciseCategories
        .where((cat) => selectedCategories.contains(cat.name))
        .expand((cat) => cat.exercises)
        .toList();
  }

  void _saveAndGoBack() {
    _saveExercises().then((_) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context, {
        'day': widget.day,
        'categories': selectedCategories,
      });
    });
  }

  void _addExercise() {
    showDialog(
      context: context,
      builder: (context) {
        String newExerciseName = '';

        return AlertDialog(
          title: const Text('افزودن تمرین جدید'),
          content: TextField(
            decoration:
                const InputDecoration(hintText: 'نام تمرین را وارد کنید'),
            onChanged: (value) {
              newExerciseName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('لغو'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _exercises.add(WorkoutExercise(newExerciseName, 3, 10));
                  _saveExercises();
                });
                Navigator.pop(context);
              },
              child: const Text('افزودن'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تمرینات ${widget.day}'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveAndGoBack,
            tooltip: 'ذخیره و بازگشت',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetDay,
            tooltip: 'ریست کردن تمامی تمرینات',
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addExercise,
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: const Text("انتخاب کن"),
              value: dropdownValue,
              items: exerciseCategories
                  .where(
                      (category) => !selectedCategories.contains(category.name))
                  .map((category) {
                return DropdownMenuItem<String>(
                  value: category.name,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategories.add(value);
                    dropdownValue = null; // بازگشت به حالت "انتخاب کن"
                  });
                  _saveExercises();
                }
              },
            ),
            Wrap(
              spacing: 8,
              children: selectedCategories.map((cat) {
                return Chip(
                  label: Text(cat),
                  onDeleted: () {
                    setState(() {
                      selectedCategories.remove(cat);
                    });
                    _saveExercises();
                  },
                );
              }).toList(),
            ),
            ..._exercises.asMap().entries.map((entry) {
              final index = entry.key;
              final exercise = entry.value;

              return ExerciseRow(
                exercise: exercise,
                availableExercises: _getExercisesForSelectedCategories(),
                availableTechniques: trainingTechniques
                    .map((technique) => technique.name)
                    .toList(),
                onExerciseChanged: (updatedExercise) =>
                    _updateExercise(index, updatedExercise),
                index: index + 1,
              );
              // ignore: unnecessary_to_list_in_spreads
            }).toList(),
          ],
        ),
      ),
    );
  }
}
