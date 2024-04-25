import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/entity/group.dart';

class GroupFormWidgetModel {
  String title = ''; // Это для строки, а она уже будет добавляться в лист

  void saveGroup(BuildContext context) async {
    if (title == '') return;
    if (!Hive.isAdapterRegistered(1)) {
      return Hive.registerAdapter(PersonAdapter());
    }

    final box = await Hive.openBox<Person>('group'); // Открываем бд
    var source = Person(name: title);
    await box.add(source);
    print(box.getAt(1));
    Navigator.of(context).pop();
  }
}

class GroupFormWidgetModelProvider extends InheritedNotifier {
  final GroupFormWidgetModel model;
  const GroupFormWidgetModelProvider({
    super.key,
    required this.model,
    required super.child,
  });

  static GroupFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelProvider>();
  }

  static GroupFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupFormWidgetModelProvider>()
        ?.widget;
    return widget is GroupFormWidgetModelProvider ? widget : null;
  }
}
