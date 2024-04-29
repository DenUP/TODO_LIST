import 'package:flutter/material.dart';

class TasksWidgetModel extends ChangeNotifier {}

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
