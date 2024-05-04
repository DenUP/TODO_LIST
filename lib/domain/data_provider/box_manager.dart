import 'package:hive/hive.dart';
import 'package:todo_list/domain/entity/group.dart';
import 'package:todo_list/domain/entity/task.dart';

class BoxManagart {
  static final BoxManagart instance = BoxManagart._();

  BoxManagart._();

  Future<Box<Group>> openGroupBox() async {
    return _openBox('todo', 1, GroupAdapter());
  }

  Future<Box<Task>> openTaskBox(int groupKey) async {
    return _openBox(makeTaskBox(groupKey), 2, TaskAdapter());
  }

  String makeTaskBox(int groupKey) => 'task_$groupKey';

  Future<void> closeBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  Future<Box<T>> _openBox<T>(
    String name,
    int typeId,
    TypeAdapter<T> adapter,
  ) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }
}
