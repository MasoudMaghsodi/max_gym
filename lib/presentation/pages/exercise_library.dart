import 'package:flutter/material.dart';
import 'package:max_gym/data/datasources/local_datasource.dart';
import 'package:max_gym/data/datasources/remote_datasource.dart';
import 'package:max_gym/data/models/exercise_model.dart';
import 'package:max_gym/data/models/technique_model.dart';
import 'package:max_gym/data/repositories/workout_repository.dart';
import 'package:max_gym/services/isar_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExerciseLibraryPage extends StatefulWidget {
  const ExerciseLibraryPage({super.key});

  @override
  State<ExerciseLibraryPage> createState() => _ExerciseLibraryPageState();
}

class _ExerciseLibraryPageState extends State<ExerciseLibraryPage> {
  late WorkoutRepository _repo;
  List<Exercise> _exercises = [];
  List<Technique> _techniques = [];

  @override
  void initState() {
    super.initState();
    _repo = WorkoutRepository(
      localDataSource: LocalDataSource(IsarService.isar),
      remoteDataSource: RemoteDataSource(Supabase.instance.client),
    );
    _loadData();
  }

  Future<void> _loadData() async {
    final exercises = await _repo.getAllExercises();
    final techniques = await _repo.getAllTechniques();
    setState(() {
      _exercises = exercises;
      _techniques = techniques;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('کتابخانه تمرینات')),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'تمرینات'),
                Tab(text: 'تکنیک‌ها'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: _exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = _exercises[index];
                      return ListTile(
                        title: Text(exercise.name),
                        subtitle: Text('ابزار: ${exercise.tool}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteExercise(exercise.id),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: _techniques.length,
                    itemBuilder: (context, index) {
                      final technique = _techniques[index];
                      return ListTile(
                        title: Text(technique.name),
                        subtitle: Text(technique.description),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteTechnique(technique.id),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اضافه کردن'),
        content: const Text('اینجا فرم اضافه کردن میاد (موقتاً ساده)'),
        actions: [
          TextButton(
            onPressed: () async {
              final exercise = Exercise(name: 'پرس سینه', tool: 'barbell');
              await _repo.saveExercise(exercise);
              _loadData();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('تمرین'),
          ),
          TextButton(
            onPressed: () async {
              final technique =
                  Technique(name: 'ددلیفت', description: 'بلند کردن درست');
              await _repo.saveTechnique(technique);
              _loadData();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('تکنیک'),
          ),
        ],
      ),
    );
  }

  void _deleteExercise(int id) async {
    await _repo.deleteExercise(id);
    _loadData();
  }

  void _deleteTechnique(int id) async {
    await _repo.deleteTechnique(id);
    _loadData();
  }
}
