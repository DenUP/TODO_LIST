import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entity/group.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _group = <Person>[];

  List<Person> get groups => _group.toList();

  void showFrom(BuildContext context) {
    // function for navigation //

    Navigator.of(context).pushNamed('/groups/form');
  }

  void _readGroupsForm(Box<Person> box) {
    _group = box.values.toList();
    notifyListeners();
  }

  void setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PersonAdapter());
    }
    final box = await Hive.openBox<Person>('group');
    _readGroupsForm(box);
    box.listenable().addListener(() => _readGroupsForm(box));
  }
}

class GroupsWidgetProvider extends InheritedNotifier {
  final GroupsWidgetModel model;
  const GroupsWidgetProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(notifier: model);

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
