import 'package:isar/isar.dart';
part 'technique_model.g.dart';

@Collection()
class Technique {
  Id id = Isar.autoIncrement;
  late String name;
}
