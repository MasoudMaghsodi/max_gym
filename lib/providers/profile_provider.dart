import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/profile.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, Map<String, String>>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends StateNotifier<Map<String, String>> {
  ProfileNotifier() : super({}) {
    _initializeIsar();
  }

  late Isar _isar;

  Future<void> _initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ProfileSchema],
      directory: dir.path,
    );
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final profiles = await _isar.profiles.where().findAll();
    if (profiles.isNotEmpty) {
      state = profiles.first.toMap();
    }
  }

  Future<void> updateProfile(Map<String, String> newProfile) async {
    state = newProfile;
    final profile = Profile.fromMap(newProfile);
    await _isar.writeTxn(() async {
      await _isar.profiles.put(profile);
    });
  }

  Future<void> resetProfile() async {
    state = {};
    await _isar.writeTxn(() async {
      await _isar.profiles.clear();
    });
  }
}
