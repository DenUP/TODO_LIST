import 'package:flutter/material.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';

class App extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainNavigation.initialRoute,
      routes: mainNavigation.router,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      // theme: ThemeData(primaryColor: Colors.amber),
    );
  }
}
