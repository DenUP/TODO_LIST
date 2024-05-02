import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entity/group.dart';
import 'package:todo_list/domain/entity/task.dart';

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
    final box = await Hive.openBox<Group>('todo');
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }
    await Hive.openBox<Task>('task');
    saveFrom(box);
    box.listenable().addListener(() => saveFrom(box));
  }

  void delItem(int indexList) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('todo');
    await box.getAt(indexList)?.tasks?.deleteAllFromHive();
    await box.deleteAt(indexList);
  }

  void showFrom(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  void showTask(BuildContext context, int indexGroup) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('todo');
    final groupKey = box.keyAt(indexGroup) as int;

    unawaited(
      Navigator.of(context).pushNamed(
        '/groups/tasks',
        arguments: groupKey,
      ),
    );
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
