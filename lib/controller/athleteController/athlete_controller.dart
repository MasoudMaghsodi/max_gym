import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../model/athleteModel/athlete_model.dart';
import '../../providers/isarProviders/isar_provider.dart';

class AthleteController {
  final Isar isar;

  AthleteController(this.isar);
  final athleteControllerProvider = Provider<AthleteController>((ref) {
    final isar = ref.watch(isarProvider).value!;
    return AthleteController(isar);
  });

  Future<void> addAthlete(Athlete athlete) async {
    await isar.writeTxn(() async {
      await isar.athletes.put(athlete);
    });
  }

  Future<void> updateAthlete(Athlete athlete) async {
    await isar.writeTxn(() async {
      await isar.athletes.put(athlete);
    });
  }

  Future<void> deleteAthlete(int id) async {
    await isar.writeTxn(() async {
      await isar.athletes.delete(id);
    });
  }

  Future<List<Athlete>> getAthletes() async {
    return await isar.athletes.where().findAll();
  }
}
