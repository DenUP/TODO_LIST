import 'package:flutter/material.dart';

class GroupsFormWidgetModel {}

class GroupsFormWidgetProvider extends InheritedNotifier {
  final GroupsFormWidgetModel model;
  const GroupsFormWidgetProvider(
      {super.key, required this.model, required Widget child})
      : super(child: child);

  static GroupsFormWidgetProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsFormWidgetProvider>();
  }

  static GroupsFormWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupsFormWidgetProvider>()
        ?.widget;
    return widget is GroupsFormWidgetProvider ? widget : null;
  }
}
