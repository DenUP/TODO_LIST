import 'package:flutter/material.dart';
import 'package:todo_list/task_form/task_form_widget.dart';
import 'package:todo_list/tasks/tasks_widget.dart';

import 'package:todo_list/widgets/groups_form_widget.dart';
import 'package:todo_list/widgets/groups_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/groups',
      routes: {
        '/groups': (context) => const GroupsWidget(),
        '/groups/form': (context) => const GroupsFormWidget(),
        '/groups/tasks': (context) => const TasksWidget(),
        '/groups/tasks/form': (context) => const TaskFormWidget(),
      },
    );
  }
}
