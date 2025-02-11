import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/athlete_repository.dart';
import '../entities/athlete_entity.dart';

/// Use case برای دریافت تمام ورزشکاران و تبدیل آن‌ها به [AthleteEntity]
class GetAllAthletes {
  final AthleteRepository repository;

  GetAllAthletes(this.repository);

  /// دریافت تمام ورزشکاران و تبدیل آن‌ها به موجودیت‌ها
  Future<List<AthleteEntity>> call() async {
    try {
      final athletesAsync = await repository.getAllAthletes();

      return athletesAsync.when(
        data: (athletesList) {
          if (athletesList.isEmpty) {
            throw Exception('هیچ ورزشکاری یافت نشد!');
          }
          return athletesList.map((e) => AthleteEntity.fromModel(e)).toList();
        },
        error: (error, stackTrace) {
          throw Exception('خطا در دریافت ورزشکاران: ${error.toString()}');
        },
        loading: () {
          throw Exception('در حال دریافت ورزشکاران...');
        },
      );
    } catch (e, stackTrace) {
      throw Exception('خطای غیرمنتظره: ${e.toString()}\n$stackTrace');
    }
  }
}
