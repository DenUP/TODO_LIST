import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  late String name;
}
