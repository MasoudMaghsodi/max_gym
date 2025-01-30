import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/exercise_category.dart';
import '../../models/exercise_data.dart';

final exerciseProvider = Provider<List<ExerciseCategory>>((ref) {
  return exerciseCategories;
});
