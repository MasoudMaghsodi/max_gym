import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/services/isar_service.dart';
part 'settings_service.g.dart';

class SettingsService extends StateNotifier<Settings> {
  SettingsService() : super(Settings());

  static Future<void> init() async {}

  Future<void> loadSettings() async {
    final settings =
        await IsarService.isar.collection<SettingsData>().where().findFirst();
    if (settings != null) {
      state = Settings(
        themeMode: _themeModeFromString(settings.themeMode),
        language: settings.language,
      );
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _saveSettings();
  }

  Future<void> setLanguage(String language) async {
    state = state.copyWith(language: language);
    await _saveSettings();
  }

  Future<void> _saveSettings() async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.collection<SettingsData>().put(
            SettingsData()
              ..themeMode = state.themeMode.toString()
              ..language = state.language,
          );
    });
  }

  ThemeMode _themeModeFromString(String mode) {
    switch (mode) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}

class Settings {
  final ThemeMode themeMode;
  final String language;

  Settings({
    this.themeMode = ThemeMode.system,
    this.language = 'fa',
  });

  Settings copyWith({ThemeMode? themeMode, String? language}) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
    );
  }
}

@collection
class SettingsData {
  Id id = Isar.autoIncrement;
  late String themeMode;
  late String language;
}

final settingsServiceProvider =
    StateNotifierProvider<SettingsService, Settings>(
        (ref) => SettingsService());
