import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/data/datasources/local_datasource.dart';
import 'package:max_gym/data/datasources/remote_datasource.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:max_gym/data/models/exercise_model.dart';
import 'package:max_gym/data/models/technique_model.dart';
import 'package:max_gym/data/repositories/workout_repository.dart';
import 'package:max_gym/presentation/widgets/workout_card.dart';
import 'package:max_gym/services/isar_service.dart';
import 'package:max_gym/services/notification_service.dart';
import 'package:max_gym/services/pdf_service.dart';
import 'package:max_gym/services/qr_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WorkoutPlanPage extends StatefulWidget {
  final Athlete athlete;

  const WorkoutPlanPage({super.key, required this.athlete});

  @override
  State<WorkoutPlanPage> createState() => _WorkoutPlanPageState();
}

class _WorkoutPlanPageState extends State<WorkoutPlanPage> {
  late List<WorkoutPlan> _weeklyPlans;
  final List<String> _days = [
    'شنبه',
    'یک‌شنبه',
    'دوشنبه',
    'سه‌شنبه',
    'چهارشنبه',
    'پنج‌شنبه',
    'جمعه'
  ];
  List<Exercise> _exercises = [];
  List<Technique> _techniques = [];

  @override
  void initState() {
    super.initState();
    _weeklyPlans = List.generate(
        7,
        (index) => WorkoutPlan(
              athleteId: widget.athlete.id,
              dayOfWeek: index,
              type: 'rest',
              targetMuscles: [],
              exerciseIds: [],
            ));
    _loadPlans();
    _loadLibrary();
    NotificationService.init(); // راه‌اندازی اعلانات
  }

  Future<void> _loadPlans() async {
    final repo = WorkoutRepository(
      localDataSource: LocalDataSource(IsarService.isar),
      remoteDataSource: RemoteDataSource(Supabase.instance.client),
    );
    final plans = await repo.getWorkoutPlansByAthleteId(widget.athlete.id);
    setState(() {
      for (var plan in plans) {
        _weeklyPlans[plan.dayOfWeek] = plan;
      }
    });
  }

  Future<void> _loadLibrary() async {
    final repo = WorkoutRepository(
      localDataSource: LocalDataSource(IsarService.isar),
      remoteDataSource: RemoteDataSource(Supabase.instance.client),
    );
    _exercises = await repo.getAllExercises();
    _techniques = await repo.getAllTechniques();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('برنامه تمرینی ${widget.athlete.firstName}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: _downloadPdf,
          ),
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: _generateQr,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                final plan = _weeklyPlans[index];
                return GestureDetector(
                  onTap: () => _editPlan(plan),
                  child: Container(
                    width: 100.w,
                    margin: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: _getDayColor(plan.type),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        _days[index],
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _weeklyPlans.length,
              itemBuilder: (context, index) {
                return WorkoutCard(
                  workoutPlan: _weeklyPlans[index],
                  onEdit: () => _editPlan(_weeklyPlans[index]),
                  onDelete: () => _deletePlan(_weeklyPlans[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _editPlan(null),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getDayColor(String type) {
    switch (type) {
      case 'training':
        return AppColors.primary;
      case 'rest':
        return Colors.grey.withValues(alpha: 0.5);
      case 'off':
        return AppColors.error.withValues(alpha: 0.5);
      default:
        return Colors.grey;
    }
  }

  void _editPlan(WorkoutPlan? plan) async {
    final newPlan = await _showEditDialog(plan ??
        WorkoutPlan(
          athleteId: widget.athlete.id,
          dayOfWeek: 0,
          type: 'training',
          targetMuscles: [],
          exerciseIds: [],
        ));
    if (newPlan != null) {
      setState(() {
        _weeklyPlans[newPlan.dayOfWeek] = newPlan;
      });
      final repo = WorkoutRepository(
        localDataSource: LocalDataSource(IsarService.isar),
        remoteDataSource: RemoteDataSource(Supabase.instance.client),
      );
      await repo.saveWorkoutPlan(newPlan);
      // تنظیم اعلان
      await NotificationService.scheduleNotification(
        id: newPlan.dayOfWeek,
        title: 'تمرین امروز',
        body:
            'امروز ${_days[newPlan.dayOfWeek]} برنامه ${newPlan.targetMuscles.join(', ')} داری!',
        scheduledDate: DateTime.now()
            .add(Duration(days: newPlan.dayOfWeek - DateTime.now().weekday)),
      );
    }
  }

  void _deletePlan(WorkoutPlan plan) async {
    final repo = WorkoutRepository(
      localDataSource: LocalDataSource(IsarService.isar),
      remoteDataSource: RemoteDataSource(Supabase.instance.client),
    );
    await repo.deleteWorkoutPlan(plan.id);
    setState(() {
      _weeklyPlans[plan.dayOfWeek] = WorkoutPlan(
        athleteId: widget.athlete.id,
        dayOfWeek: plan.dayOfWeek,
        type: 'rest',
        targetMuscles: [],
        exerciseIds: [],
      );
    });
    await NotificationService.cancelNotification(plan.dayOfWeek);
  }

  Future<WorkoutPlan?> _showEditDialog(WorkoutPlan plan) async {
    String selectedType = plan.type;
    List<String> selectedMuscles = List.from(plan.targetMuscles);
    List<Map<String, dynamic>> exercises = List.from(plan.exerciseIds);
    return showDialog<WorkoutPlan>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('ویرایش برنامه'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                  value: selectedType,
                  items: const [
                    DropdownMenuItem(value: 'training', child: Text('تمرین')),
                    DropdownMenuItem(value: 'rest', child: Text('استراحت')),
                    DropdownMenuItem(value: 'off', child: Text('تعطیل')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                if (selectedType == 'training') ...[
                  Wrap(
                    spacing: 8.w,
                    children:
                        ['سینه', 'پشت', 'بازو', 'شانه', 'پا'].map((muscle) {
                      return FilterChip(
                        label: Text(muscle),
                        selected: selectedMuscles.contains(muscle),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedMuscles.add(muscle);
                            } else {
                              selectedMuscles.remove(muscle);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                    onPressed: () async {
                      final newExercise = await _addExerciseDialog();
                      if (newExercise != null) {
                        setState(() {
                          exercises.add(newExercise);
                        });
                      }
                    },
                    child: const Text('اضافه کردن تمرین'),
                  ),
                  ...exercises.map((exercise) => ListTile(
                        title: Text(exercise['name']),
                        subtitle: Text(
                            '${exercise['sets']} ست، ${exercise['reps']} تکرار'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              exercises.remove(exercise);
                            });
                          },
                        ),
                      )),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('لغو'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(
                  context,
                  WorkoutPlan(
                    athleteId: plan.athleteId,
                    dayOfWeek: plan.dayOfWeek,
                    type: selectedType,
                    targetMuscles: selectedMuscles,
                    exerciseIds: exercises.map((e) => e['id'] as int).toList(),
                  )),
              child: const Text('ثبت'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> _addExerciseDialog() async {
    String? selectedExercise;
    String? selectedTechnique;
    int sets = 1;
    int reps = 1;
    return showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('اضافه کردن تمرین'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                hint: const Text('تمرین'),
                value: selectedExercise,
                items: _exercises
                    .map((e) =>
                        DropdownMenuItem(value: e.name, child: Text(e.name)))
                    .toList(),
                onChanged: (value) => setState(() => selectedExercise = value),
              ),
              DropdownButton<String>(
                hint: const Text('تکنیک'),
                value: selectedTechnique,
                items: _techniques
                    .map((t) =>
                        DropdownMenuItem(value: t.name, child: Text(t.name)))
                    .toList(),
                onChanged: (value) => setState(() => selectedTechnique = value),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'ست'),
                keyboardType: TextInputType.number,
                onChanged: (value) => sets = int.tryParse(value) ?? 1,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'تکرار'),
                keyboardType: TextInputType.number,
                onChanged: (value) => reps = int.tryParse(value) ?? 1,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('لغو'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, {
                'name': selectedExercise ?? 'بدون نام',
                'tool': _exercises
                    .firstWhere(
                      (e) => e.name == selectedExercise,
                      orElse: () => Exercise(
                        name: '',
                        tool: '',
                      ),
                    )
                    .tool,
                'technique': selectedTechnique ?? '',
                'sets': sets,
                'reps': reps,
                'note': '',
              }),
              child: const Text('اضافه'),
            ),
          ],
        ),
      ),
    );
  }

  void _downloadPdf() async {
    final pdfPath =
        await PdfService.generateWorkoutPdf(_weeklyPlans, widget.athlete);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF دانلود شد: $pdfPath')),
    );
  }

  void _generateQr() async {
    final qrUrl = await QrService.generateQrCode(_weeklyPlans, widget.athlete);
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('QR برنامه'),
        content: Image.network(qrUrl),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('بستن'),
          ),
        ],
      ),
    );
  }
}
