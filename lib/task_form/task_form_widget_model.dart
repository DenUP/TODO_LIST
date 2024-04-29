import 'package:flutter/material.dart';

class TaskFormWidgetModel extends ChangeNotifier {}

class TaskFormWidgetModelProvider extends InheritedNotifier {
  final TaskFormWidgetModel model;
  TaskFormWidgetModelProvider({
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
}
