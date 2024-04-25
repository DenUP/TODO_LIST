import 'package:flutter/widgets.dart';

import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entity/group.dart';

class GroupsFormWidgetModel {
  void loadData() async {
    if (!Hive.isAdapterRegistered(1)) {
      return Hive.registerAdapter(PersonAdapter());
    }

    var box = await Hive.openBox<Person>('todo'); // Открываем бд
  }
}

class GroupsFormwidgetProvider extends InheritedNotifier {
  final GroupsFormWidgetModel model;
  const GroupsFormwidgetProvider({
    super.key,
    required this.model,
    required super.child,
  });

  static GroupsFormwidgetProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsFormwidgetProvider>();
  }

  static GroupsFormwidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupsFormwidgetProvider>()
        ?.widget;
    return widget is GroupsFormwidgetProvider ? widget : null;
  }
}
