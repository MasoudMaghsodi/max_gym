import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/services/isar_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:max_gym/core/network/supabase_config.dart';
import 'package:max_gym/core/theme/theme_config.dart';
import 'package:max_gym/presentation/pages/splash_screen.dart';
import 'package:max_gym/presentation/pages/stats_page.dart';
import 'package:max_gym/services/crashlytics_service.dart';
import 'package:max_gym/services/settings_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.supabaseKey,
  );

  await IsarService.init();
  await CrashlyticsService.init();
  await SettingsService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(settingsServiceProvider.notifier).loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsServiceProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Max Gym',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.themeMode,
          locale: Locale(settings.language),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/stats': (context) => const StatsPage(),
          },
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return Directionality(
              textDirection: settings.language == 'fa'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: child!,
            );
          },
        );
      },
    );
  }
}
