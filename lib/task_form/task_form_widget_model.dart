import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/domain/entity/group.dart';
import 'package:todo_list/domain/entity/task.dart';

class TaskFormWidgetModel {
  int groupKey;
  var taskText = '';

  TaskFormWidgetModel({required this.groupKey});
  void saveTask(BuildContext context) async {
    if (taskText.isEmpty) return;

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final taskBox = await Hive.openBox<Task>('task');
    final task = Task(name: taskText, isDone: false);
    await taskBox.add(task);

    final groupBox = await Hive.openBox<Group>('todo');
    final group = groupBox.get(groupKey);
    group?.addTask(taskBox, task);
    Navigator.of(context).pop();
  }
}

class TaskFormWidgetModelProvider extends InheritedNotifier {
  final TaskFormWidgetModel model;
  const TaskFormWidgetModelProvider({
    required Widget child,
    required this.model,
  }) : super(
          child: child,
        );

  static TaskFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskFormWidgetModelProvider>();
  }

  static TaskFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskFormWidgetModelProvider>()
        ?.widget;
    return widget is TaskFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<Listenable> oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
}
