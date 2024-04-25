import 'package:flutter/material.dart';
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
        '/groups': (context) => const GroupWidget(),
        '/groups/form': (context) => const GroupsFormWidgetBody(),
      },
      theme: ThemeData(primaryColorLight: Colors.blue),
    );
  }
}
