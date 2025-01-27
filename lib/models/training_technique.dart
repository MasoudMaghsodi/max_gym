class TrainingTechnique {
  final String name;
  final String description;

  TrainingTechnique(this.name, this.description);
}

final List<TrainingTechnique> trainingTechniques = [
  TrainingTechnique(
      'TUT (Time Under Tension)', 'مدت زمان تنش عضلانی در طول یک ست تمرین.'),
  TrainingTechnique('Drop Set', 'کاهش وزن در هر ست بدون استراحت.'),
  TrainingTechnique('Super Set', 'انجام دو تمرین پشت سر هم بدون استراحت.'),
  TrainingTechnique('Tri Set', 'انجام سه تمرین پشت سر هم بدون استراحت.'),
  TrainingTechnique(
      'Giant Set', 'انجام چهار یا بیشتر تمرین پشت سر هم بدون استراحت.'),
  TrainingTechnique('Pyramid Set', 'افزایش یا کاهش وزن در هر ست.'),
  TrainingTechnique(
      'Rest-Pause', 'استراحت کوتاه بین تکرارها برای افزایش تعداد تکرارها.'),
  TrainingTechnique('Forced Reps',
      'کمک گرفتن از شریک تمرینی برای انجام تکرارهای بیشتر پس از رسیدن به خستگی عضلانی.'),
  TrainingTechnique('Negative Reps', 'تمرکز بر روی بخش منفی (اکسنتریک) حرکت.'),
  TrainingTechnique(
      'Partial Reps', 'انجام تکرارهای نیمه برای فشار بیشتر بر روی عضلات.'),
  TrainingTechnique('Cheat Reps',
      'استفاده از تقلب برای انجام تکرارهای بیشتر پس از رسیدن به خستگی.'),
  TrainingTechnique('Pre-Exhaustion',
      'انجام تمرین ایزوله قبل از تمرین ترکیبی برای خستگی عضلات.'),
];
