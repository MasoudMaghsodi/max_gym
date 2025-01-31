import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'view/homeScreen/home_view.dart';
import 'model/exerciseModel/exercise_model.dart';
import 'model/muscle_teq_model/muscle_group_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // مقداردهی اولیه ScreenUtil
      designSize: const Size(375, 812), // سایز پایه برای طراحی
      minTextAdapt: true, // حل مشکل `LateInitializationError`
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          // darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          locale: const Locale('fa'),
          supportedLocales: const [
            Locale('fa'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const HomeView(),
        );
      },
    );
  }
}

// Provider برای اینیشیالایز کردن Isar
final isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open([
    MuscleGroupSchema,
    ExerciseSchema,
  ], directory: dir.path);
});
