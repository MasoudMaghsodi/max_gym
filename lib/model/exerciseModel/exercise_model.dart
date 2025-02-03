import 'package:isar/isar.dart';
import '../muscle_teq_model/muscle_group_model.dart';
part 'exercise_model.g.dart';

// مدل حرکات ورزشی
@Collection()
class Exercise {
  Id id = Isar.autoIncrement;

  @Index()
  late String name;

  final muscleGroup =
      IsarLink<MuscleGroup>(); // استفاده از IsarLink برای عضله هدف

  // افزودن زمان ایجاد برای پیگیری
  @Index()
  DateTime createdAt = DateTime.now();
}

// داده‌های پیشفرض اولیه
final defaultMuscleGroups = [
  MuscleGroup()
    ..name = 'سینه'
    ..exercises.addAll([
      Exercise()..name = 'پرس سینه هالتر',
      Exercise()..name = 'پرس بالا سینه دمبل',
      Exercise()..name = 'کراس اور',
      Exercise()..name = 'پرس زیر سینه هالتر',
      Exercise()..name = 'فلای سینه دمبل',
      Exercise()..name = 'پرس سینه دستگاه',
      Exercise()..name = 'پول آور',
      Exercise()..name = 'پرس سینه دست جمع',
      Exercise()..name = 'پرس سینه سیم کش',
      Exercise()..name = 'شنا سوئدی',
    ]),
  MuscleGroup()
    ..name = 'پشت بازو'
    ..exercises.addAll([
      Exercise()..name = 'پشت بازو هالتر',
      Exercise()..name = 'دیپ',
      Exercise()..name = 'پشت بازو سیمکش',
      Exercise()..name = 'پشت بازو دمبل جفت',
      Exercise()..name = 'پشت بازو دست بسته',
      Exercise()..name = 'پشت بازو سیمکش بالای سر',
    ]),
  MuscleGroup()
    ..name = 'زیربغل'
    ..exercises.addAll([
      Exercise()..name = 'لت دستگاه',
      Exercise()..name = 'بارفیکس',
      Exercise()..name = 'زیربغل هالتر خم',
      Exercise()..name = 'زیربغل دمبل خم',
      Exercise()..name = 'پول آور زیربغل',
      Exercise()..name = 'کابل زیربغل',
      Exercise()..name = 'زیربغل دست باز',
      Exercise()..name = 'زیربغل دستگاه معکوس',
      Exercise()..name = 'زیربغل سیمکش پایین کش',
    ]),
  MuscleGroup()
    ..name = 'پا'
    ..exercises.addAll([
      Exercise()..name = 'اسکوات',
      Exercise()..name = 'پرس پا',
      Exercise()..name = 'لانگز',
      Exercise()..name = 'هاک اسکوات',
      Exercise()..name = 'ددلیفت',
      Exercise()..name = 'جلو بازو پا',
      Exercise()..name = 'پشت پا خوابیده',
      Exercise()..name = 'ساق پا ایستاده',
      Exercise()..name = 'ساق پا نشسته',
      Exercise()..name = 'پلانک پا',
      Exercise()..name = 'پل باسن',
    ]),
  MuscleGroup()
    ..name = 'سرشانه'
    ..exercises.addAll([
      Exercise()..name = 'پرس سرشانه دمبل',
      Exercise()..name = 'نشر از جانب',
      Exercise()..name = 'نشر از جلو',
      Exercise()..name = 'سرشانه دستگاه',
      Exercise()..name = 'پرس سرشانه هالتر',
      Exercise()..name = 'کول با هالتر',
      Exercise()..name = 'نشر از پشت',
      Exercise()..name = 'سرشانه سیمکش',
      Exercise()..name = 'پرس آرنولد',
    ]),
  MuscleGroup()
    ..name = 'هوازی'
    ..exercises.addAll([
      Exercise()..name = 'دویدن',
      Exercise()..name = 'طناب زدن',
      Exercise()..name = 'دوچرخه ثابت',
      Exercise()..name = 'الپتیکال',
      Exercise()..name = 'شنا',
      Exercise()..name = 'پیاده روی',
      Exercise()..name = 'ایروبیک',
      Exercise()..name = 'زومبا',
      Exercise()..name = 'ورزش‌های اینتروال',
    ]),
];
