import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';

import '../isarProviders/isar_provider.dart';

final athleteProvider = Provider((ref) {
  final isar = ref.watch(isarProvider).value!;
  return AthleteController(isar);
});

class AthleteController {
  final Isar isar;

  AthleteController(this.isar);

  // ذخیره Athlete جدید
  Future<void> saveAthlete(Athlete athlete) async {
    await isar.writeTxn(() async {
      await isar.athletes.put(athlete);
    });
  }

  // حذف تمام Athleteها
  Future<void> deleteAllAthletes() async {
    await isar.writeTxn(() async {
      await isar.athletes.clear();
    });
  }

  // دریافت تمام Athleteها
  Future<List<Athlete>> getAllAthletes() async {
    return await isar.athletes.where().findAll();
  }

  // در کلاس AthleteController
  Future<void> updateAthlete(Athlete athlete) async {
    await isar.writeTxn(() async {
      await isar.athletes.put(athlete);
    });
  }
}
