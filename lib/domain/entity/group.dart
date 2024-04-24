import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  String name;

  Person({required this.name});
}
