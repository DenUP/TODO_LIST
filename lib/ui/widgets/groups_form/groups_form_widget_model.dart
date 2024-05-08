import 'package:flutter/material.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entity/group.dart';

class GroupsFormWidgetModel extends ChangeNotifier {
  String? errorText;
  var title = '';
  void saveGroup(BuildContext context) async {
    final title = this.title.trim();
    if (title.isEmpty) {
      errorText = 'Введите текст';
      notifyListeners();
      return;
    }
    ;
    final box = await BoxManagart.instance.openGroupBox();
    final source = Group(name: title);
    await box.add(source);
    await BoxManagart.instance.closeBox(box);
    Navigator.of(context).pop();
  }
}

class GroupsFormWidgetProvider extends InheritedNotifier {
  final GroupsFormWidgetModel model;
  const GroupsFormWidgetProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          child: child,
          notifier: model,
        );

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
