import 'package:isar/isar.dart';
part 'week_day_model.g.dart';

enum Day { saturday, sunday, monday, tuesday, wednesday, thursday, friday }

@Collection()
class WeekDay {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name) // افزودن این خط
  late Day day;

  late bool isActive;
}
