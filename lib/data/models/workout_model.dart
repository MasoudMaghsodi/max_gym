import 'package:isar/isar.dart';
part 'workout_model.g.dart';

@collection
class WorkoutPlan {
  Id id = Isar.autoIncrement; // شناسه منحصر به فرد

  @Index(type: IndexType.value)
  int athleteId; // کلید خارجی برای ورزشکار

  String day; // روز هفته (مثلاً دوشنبه)
  bool isRestDay; // آیا روز استراحته؟
  final List<WorkoutExercise> exercises; // لیست تمرینات
  WorkoutPlan({
    required this.id,
    required this.athleteId,
    required this.day,
    required this.isRestDay,
    required this.exercises,
  });

  /// تبدیل مدل به Map برای سازگاری با Supabase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'athleteId': athleteId,
      'day': day,
      'isRestDay': isRestDay,
      'exercises': exercises.map((card) => card.toMap()).toList(),
    };
  }

  /// ایجاد مدل از Map (برای Supabase)
  factory WorkoutPlan.fromMap(Map<String, dynamic> map) {
    return WorkoutPlan(
      id: map['id'],
      athleteId: map['athleteId'],
      day: map['day'],
      isRestDay: map['isRestDay'],
      exercises: (map['WorkoutExercises'] as List)
          .map((card) => WorkoutExercise.fromMap(card))
          .toList(),
    );
  }
}

@embedded
class WorkoutExercise {
  String? exerciseName; // نام تمرین
  int? sets; // تعداد ست‌ها
  int? reps; // تعداد تکرارها
  String? technique; // تکنیک (مثلاً سوپرست)
  List<Superset>? supersets = []; // لیست سوپرست‌ها

  WorkoutExercise({
    this.exerciseName,
    this.sets,
    this.reps,
    this.technique,
    this.supersets,
  });

  Map<String, dynamic> toMap() {
    return {
      'exerciseName': exerciseName,
      'sets': sets,
      'reps': reps,
      'technique': technique,
      'supersets': supersets?.map((s) => s.toMap()).toList(),
    };
  }

  factory WorkoutExercise.fromMap(Map<String, dynamic> map) {
    return WorkoutExercise(
      exerciseName: map['exerciseName'],
      sets: map['sets'],
      reps: map['reps'],
      technique: map['technique'],
      supersets:
          (map['supersets'] as List?)?.map((s) => Superset.fromMap(s)).toList(),
    );
  }
}

@embedded
class Superset {
  String? name; // نام سوپرست
  int? sets; // تعداد ست‌ها
  int? reps; // تعداد تکرارها
  String? technique; // تکنیک
  List<Try>? tries = []; // لیست تلاش‌ها

  Superset({
    this.name,
    this.sets,
    this.reps,
    this.technique,
    this.tries,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
      'technique': technique,
      'tries': tries?.map((t) => t.toMap()).toList(),
    };
  }

  factory Superset.fromMap(Map<String, dynamic> map) {
    return Superset(
      name: map['name'],
      sets: map['sets'],
      reps: map['reps'],
      technique: map['technique'],
      tries: (map['tries'] as List?)?.map((t) => Try.fromMap(t)).toList(),
    );
  }
}

@embedded
class Try {
  String? name; // نام تلاش
  int? sets; // تعداد ست‌ها
  int? reps; // تعداد تکرارها
  String? technique; // تکنیک

  Try({
    this.name,
    this.sets,
    this.reps,
    this.technique,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
      'technique': technique,
    };
  }

  factory Try.fromMap(Map<String, dynamic> map) {
    return Try(
      name: map['name'],
      sets: map['sets'],
      reps: map['reps'],
      technique: map['technique'],
    );
  }
}
