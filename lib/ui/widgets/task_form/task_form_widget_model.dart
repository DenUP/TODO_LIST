import 'package:flutter/material.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entity/task.dart';

class TaskFormWidgetModel extends ChangeNotifier {
  int groupKey;
  var _taskText = '';

  bool get isValid => _taskText.trim().isNotEmpty;

  set taskText(String value) {
    final textIsEmpty = _taskText.trim().isEmpty;
    _taskText = value;
    if (textIsEmpty != _taskText.trim().isEmpty) {
      notifyListeners();
    }
  }

  TaskFormWidgetModel({required this.groupKey});
  void saveTask(BuildContext context) async {
    final taskText = _taskText;
    if (taskText.isEmpty) return;

    final task = Task(name: taskText, isDone: false);
    final box = await BoxManagart.instance.openTaskBox(groupKey);
    await box.add(task);
    await BoxManagart.instance.closeBox(box);
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
          notifier: model,
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
