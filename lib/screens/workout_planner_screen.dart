import 'package:flutter/material.dart';
import '../models/workout_exercise.dart';
import '../models/exercise_data.dart';
import '../models/workout_day.dart';
import '../widgets/day_card.dart';
import '../utils/pdf_generator.dart';
import 'package:share_plus/share_plus.dart';

class WorkoutPlannerScreen extends StatefulWidget {
  final Map<String, String> profileData;

  const WorkoutPlannerScreen({super.key, required this.profileData});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutPlannerScreenState createState() => _WorkoutPlannerScreenState();
}

class _WorkoutPlannerScreenState extends State<WorkoutPlannerScreen> {
  List<WorkoutDay> workoutDays = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeDays();
  }

  void _initializeDays() {
    setState(() {
      List<String> days = [
        'شنبه',
        'یکشنبه',
        'دوشنبه',
        'سه‌شنبه',
        'چهارشنبه',
        'پنجشنبه',
      ];
      workoutDays = days
          .map((day) => WorkoutDay(
                day,
                [],
                List.generate(8, (index) => WorkoutExercise('', 0, 0)),
                isRestDay: day == 'تعطیل',
              ))
          .toList();
    });
  }

  void _resetSelections() {
    setState(() {
      for (var day in workoutDays) {
        day.exercises = List.generate(8, (index) => WorkoutExercise('', 0, 0));
        day.categories.clear();
        day.isRestDay = false;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('همه انتخاب‌ها ریست شدند'),
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('برنامه‌ریزی تمرین'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetSelections, // اتصال دکمه به تابع ریست
            tooltip: 'ریست کردن همه انتخاب‌ها',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        PdfGenerator.generatePDF(
                          context,
                          workoutDays,
                          "${widget.profileData['firstName']} ${widget.profileData['lastName']}",
                          widget.profileData,
                        );
                      } else {
                        _showSnackBar(
                            'لطفاً تمامی موارد را کامل کنید', Colors.red);
                      }
                    },
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
                      if (_formKey.currentState!.validate()) {
                        final file = await PdfGenerator.savePDF(
                          workoutDays,
                          "${widget.profileData['firstName']} ${widget.profileData['lastName']}",
                          widget.profileData,
                        );
                        await Share.shareXFiles([XFile(file.path)]);
                      } else {
                        _showSnackBar(
                            'لطفاً تمامی موارد را کامل کنید', Colors.red);
                      }
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
