import 'package:flutter/material.dart';
import 'package:max_gym/models/workout_exercise.dart';
import 'package:share_plus/share_plus.dart';
import '../models/exercise_data.dart';
import '../models/workout_day.dart';
import '../widgets/day_card.dart';
import '../utils/pdf_generator.dart';

class WorkoutPlanner extends StatefulWidget {
  const WorkoutPlanner({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutPlannerState createState() => _WorkoutPlannerState();
}

class _WorkoutPlannerState extends State<WorkoutPlanner> {
  List<WorkoutDay> workoutDays = [];
  TextEditingController athleteName = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeDays();
  }

  void _initializeDays() {
    List<String> days = [
      'شنبه',
      'یکشنبه',
      'دوشنبه',
      'سه‌شنبه',
      'چهارشنبه',
      'پنجشنبه',
    ];
    for (var day in days) {
      workoutDays.add(WorkoutDay(
        day,
        [],
        List.generate(8, (index) => WorkoutExercise('', 0, 0)),
        isRestDay: day == 'تعطیل',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/image/max.jpg',
                fit: BoxFit.fill,
                width: 45,
                height: 50,
              ),
            ),
          )
        ],
        title: const Text(
          'باشگاه مکس',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: athleteName,
                decoration: const InputDecoration(
                  labelText: 'نام ورزشکار',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'نام را وارد کنید' : null,
              ),
              const SizedBox(height: 20),
              ...workoutDays.map((day) => DayCard(
                    day: day,
                    categories: exerciseCategories,
                    onCategoryAdded: (category) {
                      setState(() => day.categories.add(category));
                    },
                    onCategoryRemoved: (category) {
                      setState(() => day.categories.remove(category));
                    },
                    onRestDayChanged: (value) {
                      setState(() => day.isRestDay = value);
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => PdfGenerator.generatePDF(
                      context,
                      workoutDays,
                      athleteName.text,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'پیش‌نمایش PDF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final file = await PdfGenerator.savePDF(
                        workoutDays,
                        athleteName.text,
                      );
                      await Share.shareXFiles([XFile(file.path)]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'ذخیره PDF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
