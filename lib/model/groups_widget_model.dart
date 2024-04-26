import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entity/group.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _group = <Person>[];

  List<Person> get group => _group;

  GroupsWidgetModel() {
    setup();
  }
  void setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PersonAdapter());
    }
    var box = await Hive.openBox<Person>('todo');
    saveFrom(box);
    box.listenable().addListener(() => saveFrom(box));
  }

  void saveFrom(Box<Person> box) {
    _group = box.values.toList();
    notifyListeners();
  }

  void navigator(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }
}

class GroupsWidgetProvider extends InheritedNotifier {
  final GroupsWidgetModel model;
  const GroupsWidgetProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          child: child,
          notifier: model,
        );

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
