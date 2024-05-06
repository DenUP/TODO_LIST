import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entity/group.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';
import 'package:todo_list/ui/widgets/tasks/tasks_widget.dart';

class GroupsWidgetModel extends ChangeNotifier {
  late final Future<Box<Group>> _box;
  var _group = <Group>[];

  List<Group> get group => _group;

  GroupsWidgetModel() {
    setup();
  }
  Future<void> setup() async {
    _box = BoxManagart.instance.openGroupBox();
    await saveFrom();
    (await _box).listenable().addListener(saveFrom);
  }

  Future<void> showTask(BuildContext context, int indexGroup) async {
    final group = (await _box).getAt(indexGroup);
    if (group != null) {
      final configuration = TasksWidgetConfiguration(
        group.key as int,
        group.name,
      );
      unawaited(
        Navigator.of(context).pushNamed(
          MainNavigationRouter.tasks,
          arguments: configuration,
        ),
      );
      BoxManagart.instance.closeBox(_box as Box);
    }
  }

  Future<void> delItem(int indexList) async {
    final box = await _box;
    final groupKey = (await _box).keyAt(indexList) as int;
    final taskBoxName = BoxManagart.instance.makeTaskBox(groupKey);
    await Hive.deleteBoxFromDisk(taskBoxName);
    await box.deleteAt(indexList);
  }

  void showFrom(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRouter.groupsForm);
  }

  Future<void> saveFrom() async {
    _group = (await _box).values.toList();
    notifyListeners();
  }

  void navigator(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouter.groupsForm,
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
