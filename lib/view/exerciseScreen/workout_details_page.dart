import 'package:flutter/material.dart';
import 'package:max_gym/model/dayModel/week_day_model.dart';
import '../../model/workoutModel/workout_card_model.dart';
import '../../widgets/exerciseWidgets/exercise_dropdown.dart';
import '../../widgets/exerciseWidgets/exercise_reps_sets.dart';
import '../../widgets/exerciseWidgets/exercise_section_title.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final WorkoutCard workoutCard; // Replaced WorkoutExercise with WorkoutCard
  final List<String> availableExercises;
  final List<String> availableTechniques;
  final Function(WorkoutCard) onExerciseChanged; // Updated callback type
  final int index;

  const WorkoutDetailsPage({
    super.key,
    required this.workoutCard,
    required this.availableExercises,
    required this.availableTechniques,
    required this.onExerciseChanged,
    required this.index,
    required WeekDay day,
  });

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  String? selectedExercise;
  String? selectedTechnique;
  String? superSetExercise;
  int? superSetReps;
  int? superSetSets;
  String? superSetTechnique;
  String? triSetExercise;
  int? triSetReps;
  int? triSetSets;
  String? triSetTechnique;
  int? selectedSets;
  int? selectedReps;
  bool isSuperSetEnabled = false;
  bool isTriSetEnabled = false;

  @override
  void initState() {
    super.initState();
    selectedExercise = widget.workoutCard.exerciseId > 0
        ? widget.workoutCard.exerciseId.toString()
        : null;
    selectedTechnique = widget.workoutCard.techniqueId?.toString();
    selectedSets = widget.workoutCard.sets;
    selectedReps = widget.workoutCard.reps;
    superSetExercise = widget.workoutCard.supersetExerciseId?.toString();
    superSetReps = widget.workoutCard.supersetReps;
    superSetSets = widget.workoutCard.supersetSets;
    superSetTechnique = widget.workoutCard.supersetTechniqueId?.toString();
    triSetExercise = widget.workoutCard.trisetExerciseId?.toString();
    triSetReps = widget.workoutCard.trisetReps;
    triSetSets = widget.workoutCard.trisetSets;
    triSetTechnique = widget.workoutCard.trisetTechniqueId?.toString();
    isSuperSetEnabled = selectedExercise != null;
    isTriSetEnabled = superSetExercise != null;
  }

  void _updateExercise() {
    widget.onExerciseChanged(
        widget.workoutCard); // Pass updated WorkoutCard to parent
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ExerciseSectionTitle(title: 'تمرین اصلی ${widget.index}'),
              ExerciseDropdown(
                value: selectedExercise,
                hint: 'انتخاب تمرین',
                items: widget.availableExercises.toSet().toList(),
                onChanged: (value) {
                  setState(() {
                    selectedExercise = value;
                    widget.workoutCard.exerciseId = int.parse(value!);
                    isSuperSetEnabled = true;
                    _updateExercise();
                  });
                },
              ),
              ExerciseDropdown(
                value: selectedTechnique,
                hint: 'انتخاب تکنیک',
                items: widget.availableTechniques.toSet().toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTechnique = value;
                    widget.workoutCard.techniqueId =
                        value != null ? int.parse(value) : null;
                    _updateExercise();
                  });
                },
              ),
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
                            widget.workoutCard.sets = value!;
                            _updateExercise();
                          });
                        },
                      ),
                    ),
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
                            widget.workoutCard.reps = value!;
                            _updateExercise();
                          });
                        },
                      ),
                    ),
                  ],
                )
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
                          widget.workoutCard.sets = value!;
                          _updateExercise();
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    ExerciseRepsSets(
                      hint: 'تکرار',
                      value: selectedReps,
                      count: 15,
                      increment: 1,
                      onChanged: (value) {
                        setState(() {
                          selectedReps = value;
                          widget.workoutCard.reps = value!;
                          _updateExercise();
                        });
                      },
                    ),
                  ],
                ),
              if (isSuperSetEnabled) ...[
                const Divider(thickness: 1.5),
                ListTile(
                  title: const Text('سوپرست'),
                  trailing: Icon(
                    isSuperSetEnabled ? Icons.expand_less : Icons.expand_more,
                  ),
                  onTap: () {
                    setState(() {
                      isSuperSetEnabled = !isSuperSetEnabled;
                    });
                  },
                ),
                if (isSuperSetEnabled) ...[
                  ExerciseDropdown(
                    value: superSetExercise,
                    hint: 'انتخاب تمرین سوپرست',
                    items: widget.availableExercises.toSet().toList(),
                    onChanged: (value) {
                      setState(() {
                        superSetExercise = value;
                        widget.workoutCard.supersetExerciseId =
                            value != null ? int.parse(value) : null;
                        isTriSetEnabled = true;
                        _updateExercise();
                      });
                    },
                  ),
                  ExerciseDropdown(
                    value: superSetTechnique,
                    hint: 'انتخاب تکنیک سوپرست',
                    items: widget.availableTechniques.toSet().toList(),
                    onChanged: (value) {
                      setState(() {
                        superSetTechnique = value;
                        widget.workoutCard.supersetTechniqueId =
                            value != null ? int.parse(value) : null;
                        _updateExercise();
                      });
                    },
                  ),
                  if (isWideScreen)
                    Row(
                      children: [
                        Expanded(
                          child: ExerciseRepsSets(
                            hint: 'ست سوپرست',
                            value: superSetSets,
                            count: 6,
                            increment: 1,
                            onChanged: (value) {
                              setState(() {
                                superSetSets = value;
                                widget.workoutCard.supersetSets = value!;
                                _updateExercise();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ExerciseRepsSets(
                            hint: 'تکرار سوپرست',
                            value: superSetReps,
                            count: 15,
                            increment: 1,
                            onChanged: (value) {
                              setState(() {
                                superSetReps = value;
                                widget.workoutCard.supersetReps = value!;
                                _updateExercise();
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        ExerciseRepsSets(
                          hint: 'ست سوپرست',
                          value: superSetSets,
                          count: 6,
                          increment: 1,
                          onChanged: (value) {
                            setState(() {
                              superSetSets = value;
                              widget.workoutCard.supersetSets = value!;
                              _updateExercise();
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                        ExerciseRepsSets(
                          hint: 'تکرار سوپرست',
                          value: superSetReps,
                          count: 15,
                          increment: 1,
                          onChanged: (value) {
                            setState(() {
                              superSetReps = value;
                              widget.workoutCard.supersetReps = value!;
                              _updateExercise();
                            });
                          },
                        ),
                      ],
                    ),
                ],
              ],
              if (isTriSetEnabled) ...[
                const Divider(thickness: 1.5),
                ListTile(
                  title: const Text('تریست'),
                  trailing: Icon(
                    isTriSetEnabled ? Icons.expand_less : Icons.expand_more,
                  ),
                  onTap: () {
                    setState(() {
                      isTriSetEnabled = !isTriSetEnabled;
                    });
                  },
                ),
                if (isTriSetEnabled) ...[
                  ExerciseDropdown(
                    value: triSetExercise,
                    hint: 'انتخاب تمرین تریست',
                    items: widget.availableExercises.toSet().toList(),
                    onChanged: (value) {
                      setState(() {
                        triSetExercise = value;
                        widget.workoutCard.trisetExerciseId =
                            value != null ? int.parse(value) : null;
                        _updateExercise();
                      });
                    },
                  ),
                  ExerciseDropdown(
                    value: triSetTechnique,
                    hint: 'انتخاب تکنیک تریست',
                    items: widget.availableTechniques.toSet().toList(),
                    onChanged: (value) {
                      setState(() {
                        triSetTechnique = value;
                        widget.workoutCard.trisetTechniqueId =
                            value != null ? int.parse(value) : null;
                        _updateExercise();
                      });
                    },
                  ),
                  if (isWideScreen)
                    Row(
                      children: [
                        Expanded(
                          child: ExerciseRepsSets(
                            hint: 'ست تریست',
                            value: triSetSets,
                            count: 6,
                            increment: 1,
                            onChanged: (value) {
                              setState(() {
                                triSetSets = value;
                                widget.workoutCard.trisetSets = value!;
                                _updateExercise();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ExerciseRepsSets(
                            hint: 'تکرار تریست',
                            value: triSetReps,
                            count: 15,
                            increment: 1,
                            onChanged: (value) {
                              setState(() {
                                triSetReps = value;
                                widget.workoutCard.trisetReps = value!;
                                _updateExercise();
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        ExerciseRepsSets(
                          hint: 'ست تریست',
                          value: triSetSets,
                          count: 6,
                          increment: 1,
                          onChanged: (value) {
                            setState(() {
                              triSetSets = value;
                              widget.workoutCard.trisetSets = value!;
                              _updateExercise();
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                        ExerciseRepsSets(
                          hint: 'تکرار تریست',
                          value: triSetReps,
                          count: 15,
                          increment: 1,
                          onChanged: (value) {
                            setState(() {
                              triSetReps = value;
                              widget.workoutCard.trisetReps = value!;
                              _updateExercise();
                            });
                          },
                        ),
                      ],
                    ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
