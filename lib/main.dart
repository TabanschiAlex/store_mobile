import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:project_cartridje_mobile/routes.dart';
import 'package:project_cartridje_mobile/screens/welcome/welcome_screen.dart';
import 'package:project_cartridje_mobile/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.topLevel,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
          child: widget!,
        );
      },
      title: 'Store',
      theme: theme(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
