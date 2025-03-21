import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/repositories/athlete_repository.dart';

class GetAllAthletes {
  final AthleteRepository repository;

  GetAllAthletes(this.repository);

  Future<List<Athlete>> call() async {
    try {
      final athletes = await repository.getAllAthletes();
      if (athletes.isEmpty) {
        throw Exception('هیچ ورزشکاری یافت نشد!');
      }
      return athletes;
    } catch (e) {
      throw Exception('خطا در دریافت ورزشکاران: $e');
    }
  }
}
