import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/training_technique.dart';

final techniqueProvider = Provider<List<TrainingTechnique>>((ref) {
  return trainingTechniques;
});
