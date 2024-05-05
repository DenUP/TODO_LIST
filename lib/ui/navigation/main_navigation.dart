import 'package:flutter/material.dart';
import 'package:todo_list/ui/widgets/groups/groups_widget.dart';
import 'package:todo_list/ui/widgets/groups_form/groups_form_widget.dart';
import 'package:todo_list/ui/widgets/task_form/task_form_widget.dart';
import 'package:todo_list/ui/widgets/tasks/tasks_widget.dart';

abstract class MainNavigationRouter {
  static const groups = '/';
  static const groupsForm = '/groupForm';
  static const tasks = '/tasks';
  static const tasksForm = '/tasks/form';
}

class MainNavigation {
  final initialRoute = MainNavigationRouter.groups;
  final router = <String, Widget Function(BuildContext)>{
    MainNavigationRouter.groups: (context) => const GroupsWidget(),
    MainNavigationRouter.groupsForm: (context) => const GroupsFormWidget(),
    // MainNavigationRouter.tasks: (context) => const TasksWidget(),
    // MainNavigationRouter.tasksForm: (context) => const TaskFormWidget(),
  };
  Route<Object>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouter.tasks:
        final configuration = settings.arguments as TasksWidgetConfiguration;
        return MaterialPageRoute(
          builder: (context) => TasksWidget(
            configuration: configuration,
          ),
        );
      case MainNavigationRouter.tasksForm:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => TaskFormWidget(
            groupKey: groupKey,
          ),
        );
      default:
        const widget = Text('Упс, вы ошиблись страницой...');
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: widget,
              ),
            );
          },
        );
    }
  }
}
