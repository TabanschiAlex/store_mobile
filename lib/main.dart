import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/routes.dart';
import 'package:project_cartridje_mobile/screens/welcome/welcome_screen.dart';
import 'package:project_cartridje_mobile/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store',
      theme: theme(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
