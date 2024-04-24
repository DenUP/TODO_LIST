import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/domain/entity/group.dart';

class GroupFormWidgetModel {
  String title = ''; // Это для строки, а она уже будет добавляться в лист

  void saveGroup(BuildContext context) async {
    if (!Hive.isAdapterRegistered(1)) {
      return Hive.registerAdapter(PersonAdapter());
    }

    var box = await Hive.openBox<Person>('todo'); // Открываем бд
    var source = Person(name: title);
    await box.add(source);
    print(box.values);
    print(box.keys);
    Navigator.of(context).pop();
  }
}

class GroupFormWidgetModelProvider extends InheritedNotifier {
  final GroupFormWidgetModel model;
  const GroupFormWidgetModelProvider(
      {super.key, required this.model, required super.child});

  static GroupFormWidgetModelProvider? read(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelProvider>();
  }

  static GroupFormWidgetModelProvider? watch(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupFormWidgetModelProvider>()
        ?.widget;
    return widget is GroupFormWidgetModelProvider ? widget : null;
  }
}
