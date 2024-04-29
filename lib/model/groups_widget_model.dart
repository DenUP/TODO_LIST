import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entity/group.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _group = <Group>[];

  List<Group> get group => _group;

  GroupsWidgetModel() {
    setup();
  }
  void setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    var box = await Hive.openBox<Group>('todo');
    saveFrom(box);
    box.listenable().addListener(() => saveFrom(box));
  }

  void delItem(int indexList) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    var box = await Hive.openBox<Group>('todo');
    await box.deleteAt(indexList);
  }

  void showTask(BuildContext context, int indexGroup) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('todo');
    final groupKey = box.getAt(indexGroup) as int;
    unawaited(Navigator.of(context).pushNamed(
      '/groups/tasks',
      arguments: groupKey,
    ));
  }

  void saveFrom(Box<Group> box) {
    _group = box.values.toList();
    notifyListeners();
  }

  void navigator(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/groups/form',
    );
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
