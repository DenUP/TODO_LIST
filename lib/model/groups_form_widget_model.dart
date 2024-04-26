import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GroupsFormWidgetModel {
  void saveGroup(BuildContext context, String title) async {
    // if(!Hive.isAdapterRegistered(1)){
    //   Hive.registerAdapter(adapter)
    // }
    var box = await Hive.openBox('todo');
  }
}

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
