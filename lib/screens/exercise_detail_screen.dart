import 'package:flutter/material.dart';
import '../../models/preferences_manager.dart';
import '../widgets/exerciseWidgets/exercise_list_item.dart';

class ExerciseDetailScreen extends StatefulWidget {
  // نام روز تمرین
  final String day;

  const ExerciseDetailScreen({super.key, required this.day});

  @override
  // ignore: library_private_types_in_public_api
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  // لیست تمرینات، سوپرست‌ها و تریست‌ها
  final List<String> _exercises = [];
  final List<String> _superSets = [];
  final List<String> _triSets = [];

  // کنترلرهای متنی برای افزودن تمرینات جدید
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _superSetController = TextEditingController();
  final TextEditingController _triSetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  // بارگذاری تمرینات ذخیره‌شده
  Future<void> _loadExercises() async {
    final savedExercises = PreferencesManager.getString(widget.day) ?? '';
    final savedSuperSets =
        PreferencesManager.getString('${widget.day}_superSets') ?? '';
    final savedTriSets =
        PreferencesManager.getString('${widget.day}_triSets') ?? '';

    setState(() {
      _exercises.addAll(savedExercises.split(',').where((e) => e.isNotEmpty));
      _superSets.addAll(savedSuperSets.split(',').where((e) => e.isNotEmpty));
      _triSets.addAll(savedTriSets.split(',').where((e) => e.isNotEmpty));
    });
  }

  // ذخیره تمرینات
  Future<void> _saveExercises() async {
    await PreferencesManager.setString(widget.day, _exercises.join(','));
    await PreferencesManager.setString(
        '${widget.day}_superSets', _superSets.join(','));
    await PreferencesManager.setString(
        '${widget.day}_triSets', _triSets.join(','));
  }

  // افزودن تمرین جدید
  void _addExercise(String exercise) {
    setState(() {
      _exercises.add(exercise);
      _exerciseController.clear();
    });
    _saveExercises();
  }

  // حذف تمرین
  void _removeExercise(String exercise) {
    setState(() {
      _exercises.remove(exercise);
    });
    _saveExercises();
  }

  // افزودن سوپرست جدید
  void _addSuperSet(String superSet) {
    setState(() {
      _superSets.add(superSet);
      _superSetController.clear();
    });
    _saveExercises();
  }

  // حذف سوپرست
  void _removeSuperSet(String superSet) {
    setState(() {
      _superSets.remove(superSet);
    });
    _saveExercises();
  }

  // افزودن تریست جدید
  void _addTriSet(String triSet) {
    setState(() {
      _triSets.add(triSet);
      _triSetController.clear();
    });
    _saveExercises();
  }

  // حذف تریست
  void _removeTriSet(String triSet) {
    setState(() {
      _triSets.remove(triSet);
    });
    _saveExercises();
  }

  // ریست کردن تمامی تمرینات
  void _resetData() async {
    setState(() {
      _exercises.clear();
      _superSets.clear();
      _triSets.clear();
    });
    await PreferencesManager.remove(widget.day);
    await PreferencesManager.remove('${widget.day}_superSets');
    await PreferencesManager.remove('${widget.day}_triSets');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تمرینات ${widget.day}'), // عنوان صفحه
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetData, // ریست کردن تمامی تمرینات
            tooltip: 'ریست کردن تمامی تمرینات',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _exerciseController,
                decoration: InputDecoration(
                  labelText: 'افزودن تمرین',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_exerciseController.text.isNotEmpty) {
                        _addExercise(_exerciseController.text);
                      }
                    },
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: const Text('تمرینات',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              children: _exercises.map((exercise) {
                return ExerciseListItem(
                  exercise: exercise,
                  onDelete: () => _removeExercise(exercise),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _superSetController,
                decoration: InputDecoration(
                  labelText: 'افزودن سوپرست',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_superSetController.text.isNotEmpty) {
                        _addSuperSet(_superSetController.text);
                      }
                    },
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: const Text('سوپرست‌ها',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              children: _superSets.map((superSet) {
                return ExerciseListItem(
                  exercise: superSet,
                  onDelete: () => _removeSuperSet(superSet),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _triSetController,
                decoration: InputDecoration(
                  labelText: 'افزودن تریست',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_triSetController.text.isNotEmpty) {
                        _addTriSet(_triSetController.text);
                      }
                    },
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: const Text('تریست‌ها',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              children: _triSets.map((triSet) {
                return ExerciseListItem(
                  exercise: triSet,
                  onDelete: () => _removeTriSet(triSet),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
