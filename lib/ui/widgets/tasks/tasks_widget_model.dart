import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entity/group.dart';
import 'package:todo_list/domain/entity/task.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';

class TasksWidgetModel extends ChangeNotifier {
  int groupkey;

  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  late final Future<Box<Group>> _groupBox;
  Group? _group;
  Group? get group => _group;

  TasksWidgetModel({required this.groupkey}) {
    _setup();
  }

  void _setup() async {
    _groupBox = BoxManagart.instance.openGroupBox();
    BoxManagart.instance.openTaskBox();
    _loadGroup();
    _setupListenTasks();
  }

  void task_isDone(int groupindex) async {
    final task = group?.tasks?[groupindex];
    final done = task?.isDone ?? false;
    task?.isDone = !done;
    await task?.save();
    notifyListeners();
  }

  void _readTask() {
    _tasks = _group?.tasks ?? <Task>[];
    notifyListeners();
  }

  void _setupListenTasks() async {
    final box = await BoxManagart.instance.openGroupBox();
    _readTask();
    box.listenable(keys: [groupkey]).addListener(() => _readTask);
  }

  void deleteTask(int groupIndex) async {
    await _group?.tasks?.deleteFromHive(groupIndex);
    await _group?.save();
    notifyListeners();
  }

  void showFrom(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouter.tasksForm, arguments: groupkey);
  }

  void _loadGroup() async {
    final box = await _groupBox;
    _group = box.get(groupkey);
    notifyListeners();
  }
}

class TasksWidgetModelProvider extends InheritedNotifier {
  final TasksWidgetModel model;
  TasksWidgetModelProvider({
    required Widget child,
    required this.model,
  }) : super(
          child: child,
          notifier: model,
        );

  static TasksWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksWidgetModelProvider>();
  }

  static TasksWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksWidgetModelProvider>()
        ?.widget;
    return widget is TasksWidgetModelProvider ? widget : null;
  }
}
