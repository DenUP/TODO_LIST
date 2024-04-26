import 'package:flutter/material.dart';

class GroupsWidgetModel {}

class GroupsWidgetProvider extends InheritedNotifier {
  final GroupsWidgetModel model;
  const GroupsWidgetProvider(
      {super.key, required this.model, required Widget child})
      : super(child: child);

  static GroupsWidgetProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupsWidgetProvider>();
  }

  static GroupsWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupsWidgetProvider>()
        ?.widget;
    return widget is GroupsWidgetProvider ? widget : null;
  }
}
