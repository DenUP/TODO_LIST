import 'package:hive/hive.dart';
import 'package:todo_list/domain/entity/task.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
// used id 1
class Group extends HiveObject {
  @HiveField(0)
  String name;


  Group({required this.name});
}
