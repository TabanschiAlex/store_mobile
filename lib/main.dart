import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/theme.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartridje',
      theme: theme(),
      home: const Text('Hello world'),
    );
  }

}
