import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsService {
  static Future<void> init() async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    debugPrint('✅ Crashlytics Initialized!');
  }

  static void log(String message) {
    FirebaseCrashlytics.instance.log(message);
  }

  static void recordError(dynamic exception, StackTrace? stackTrace) {
    FirebaseCrashlytics.instance.recordError(exception, stackTrace);
  }
}
