import 'package:flutter/material.dart';
import '../../models/workout_exercise.dart';
import 'exercise_dropdown.dart';
import 'exercise_reps_sets.dart';
import 'exercise_section_title.dart';

class ExerciseRow extends StatefulWidget {
  final WorkoutExercise exercise;
  final List<String> availableExercises;
  final List<String> availableTechniques;
  final Function(WorkoutExercise) onExerciseChanged;
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
  _ExerciseRowState createState() => _ExerciseRowState();
}

class _ExerciseRowState extends State<ExerciseRow> {
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
    superSetSets = widget.exercise.superSetSets;
    superSetTechnique = widget.exercise.superSetTechnique?.isNotEmpty ?? false
        ? widget.exercise.superSetTechnique
        : null;
    triSetExercise = widget.exercise.triSet?.isNotEmpty ?? false
        ? widget.exercise.triSet
        : null;
    triSetReps = widget.exercise.triSetReps;
    triSetSets = widget.exercise.triSetSets;
    triSetTechnique = widget.exercise.triSetTechnique?.isNotEmpty ?? false
        ? widget.exercise.triSetTechnique
        : null;
    isSuperSetEnabled = selectedExercise != null;
    isTriSetEnabled = superSetExercise != null;
  }

  void _updateExercise() {
    widget.onExerciseChanged(widget.exercise);
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
                    widget.exercise.name = value!;
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
                    widget.exercise.technique = value!;
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
                            widget.exercise.sets = value!;
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
                            widget.exercise.reps = value!;
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
                          widget.exercise.sets = value!;
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
                          widget.exercise.reps = value!;
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
                        widget.exercise.superSet = value;
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
                        widget.exercise.superSetTechnique = value!;
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
                                widget.exercise.superSetSets = value!;
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
                                widget.exercise.superSetReps = value!;
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
                              widget.exercise.superSetSets = value!;
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
                              widget.exercise.superSetReps = value!;
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
                        widget.exercise.triSet = value;
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
                        widget.exercise.triSetTechnique = value!;
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
                                widget.exercise.triSetSets = value!;
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
                                widget.exercise.triSetReps = value!;
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
                              widget.exercise.triSetSets = value!;
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
                              widget.exercise.triSetReps = value!;
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
