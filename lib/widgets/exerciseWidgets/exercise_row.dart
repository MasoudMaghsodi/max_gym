import 'package:flutter/material.dart';
import '../../models/workout_exercise.dart';
import 'exercise_dropdown.dart';
import 'exercise_reps_sets.dart';
import 'exercise_section_title.dart';

class ExerciseRow extends StatefulWidget {
  // مدل تمرین
  final WorkoutExercise exercise;
  // لیست تمرینات موجود
  final List<String> availableExercises;
  // لیست تکنیک‌های تمرینی موجود
  final List<String> availableTechniques;
  // تابعی که تغییرات تمرین را پردازش می‌کند
  final Function(WorkoutExercise) onExerciseChanged;
  // شماره تمرین
  final int index;

  const ExerciseRow({
    super.key,
    required this.exercise,
    required this.availableExercises,
    required this.availableTechniques,
    required this.onExerciseChanged,
    required this.index,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ExerciseRowState createState() => _ExerciseRowState();
}

class _ExerciseRowState extends State<ExerciseRow> {
  String? selectedExercise;
  String? selectedTechnique;
  String? superSetExercise;
  int? superSetReps;
  String? superSetTechnique;
  String? triSetExercise;
  int? triSetReps;
  String? triSetTechnique;
  int? selectedSets;
  int? selectedReps;

  @override
  void initState() {
    super.initState();
    selectedExercise =
        widget.exercise.name.isNotEmpty ? widget.exercise.name : null;
    selectedTechnique = widget.exercise.technique?.isNotEmpty ?? false
        ? widget.exercise.technique
        : null;
    selectedSets = widget.exercise.sets > 0 ? widget.exercise.sets : null;
    selectedReps = widget.exercise.reps > 0 ? widget.exercise.reps : null;
    superSetExercise = widget.exercise.superSet?.isNotEmpty ?? false
        ? widget.exercise.superSet
        : null;
    superSetReps = widget.exercise.superSetReps;
    superSetTechnique = widget.exercise.superSetTechnique?.isNotEmpty ?? false
        ? widget.exercise.superSetTechnique
        : null;
    triSetExercise = widget.exercise.triSet?.isNotEmpty ?? false
        ? widget.exercise.triSet
        : null;
    triSetReps = widget.exercise.triSetReps;
    triSetTechnique = widget.exercise.triSetTechnique?.isNotEmpty ?? false
        ? widget.exercise.triSetTechnique
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // فاصله عمودی بین ردیف‌ها
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(
            horizontal: 8.0), // فاصله افقی بین ردیف‌ها
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // عنوان بخش تمرین اصلی
              ExerciseSectionTitle(
                  title:
                      'تمرین اصلی ${widget.index}'), // اضافه کردن شماره تمرین
              // انتخاب تمرین
              ExerciseDropdown(
                value: selectedExercise,
                hint: 'انتخاب تمرین',
                items: widget.availableExercises,
                onChanged: (value) {
                  setState(() {
                    selectedExercise = value;
                    widget.exercise.name = value!;
                    widget.onExerciseChanged(widget.exercise);
                  });
                },
              ),
              // انتخاب تکنیک
              ExerciseDropdown(
                value: selectedTechnique,
                hint: 'انتخاب تکنیک',
                items: widget.availableTechniques,
                onChanged: (value) {
                  setState(() {
                    selectedTechnique = value;
                    widget.exercise.technique = value!;
                    widget.onExerciseChanged(widget.exercise);
                  });
                },
              ),
              // نمایش ست‌ها و تکرارها در صفحه عریض
              if (isWideScreen)
                Row(
                  children: [
                    Expanded(
                        child: ExerciseRepsSets(
                            hint: 'ست',
                            value: selectedSets,
                            count: 6,
                            increment: 1,
                            onChanged: (value) {
                              setState(() {
                                selectedSets = value;
                                widget.exercise.sets = value!;
                                widget.onExerciseChanged(widget.exercise);
                              });
                            })),
                    const SizedBox(width: 16),
                    Expanded(
                        child: ExerciseRepsSets(
                            hint: 'تکرار',
                            value: selectedReps,
                            count: 15,
                            increment: 1,
                            onChanged: (value) {
                              setState(() {
                                selectedReps = value;
                                widget.exercise.reps = value!;
                                widget.onExerciseChanged(widget.exercise);
                              });
                            })),
                  ],
                )
              // نمایش ست‌ها و تکرارها در صفحه کوچک
              else
                Column(
                  children: [
                    ExerciseRepsSets(
                        hint: 'ست',
                        value: selectedSets,
                        count: 6,
                        increment: 1,
                        onChanged: (value) {
                          setState(() {
                            selectedSets = value;
                            widget.exercise.sets = value!;
                            widget.onExerciseChanged(widget.exercise);
                          });
                        }),
                    const SizedBox(height: 8),
                    ExerciseRepsSets(
                        hint: 'تکرار',
                        value: selectedReps,
                        count: 15,
                        increment: 1,
                        onChanged: (value) {
                          setState(() {
                            selectedReps = value;
                            widget.exercise.reps = value!;
                            widget.onExerciseChanged(widget.exercise);
                          });
                        }),
                  ],
                ),
              const Divider(thickness: 1.5),
              // عنوان بخش سوپرست
              ExerciseSectionTitle(title: 'سوپرست'),
              // انتخاب تمرین سوپرست
              ExerciseDropdown(
                value: superSetExercise,
                hint: 'انتخاب تمرین سوپرست',
                items: widget.availableExercises,
                onChanged: (value) {
                  setState(() {
                    superSetExercise = value;
                    widget.exercise.superSet = value;
                    widget.onExerciseChanged(widget.exercise);
                  });
                },
              ),
              // انتخاب تکنیک سوپرست
              ExerciseDropdown(
                value: superSetTechnique,
                hint: 'انتخاب تکنیک سوپرست',
                items: widget.availableTechniques,
                onChanged: (value) {
                  setState(() {
                    superSetTechnique = value;
                    widget.exercise.superSetTechnique = value!;
                    widget.onExerciseChanged(widget.exercise);
                  });
                },
              ),
              // تعداد تکرارهای سوپرست
              ExerciseRepsSets(
                  hint: 'تکرار سوپرست',
                  value: superSetReps,
                  count: 15,
                  increment: 1,
                  onChanged: (value) {
                    setState(() {
                      superSetReps = value;
                      widget.exercise.superSetReps = value!;
                      widget.onExerciseChanged(widget.exercise);
                    });
                  }),
              const Divider(thickness: 1.5),
              // عنوان بخش تریست
              ExerciseSectionTitle(title: 'تریست'),
              // انتخاب تمرین تریست
              ExerciseDropdown(
                value: triSetExercise,
                hint: 'انتخاب تمرین تریست',
                items: widget.availableExercises,
                onChanged: (value) {
                  setState(() {
                    triSetExercise = value;
                    widget.exercise.triSet = value;
                    widget.onExerciseChanged(widget.exercise);
                  });
                },
              ),
              // انتخاب تکنیک تریست
              ExerciseDropdown(
                value: triSetTechnique,
                hint: 'انتخاب تکنیک تریست',
                items: widget.availableTechniques,
                onChanged: (value) {
                  setState(() {
                    triSetTechnique = value;
                    widget.exercise.triSetTechnique = value!;
                    widget.onExerciseChanged(widget.exercise);
                  });
                },
              ),
              // تعداد تکرارهای تریست
              ExerciseRepsSets(
                  hint: 'تکرار تریست',
                  value: triSetReps,
                  count: 15,
                  increment: 1,
                  onChanged: (value) {
                    setState(() {
                      triSetReps = value;
                      widget.exercise.triSetReps = value!;
                      widget.onExerciseChanged(widget.exercise);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
