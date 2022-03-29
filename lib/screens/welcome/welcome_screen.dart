import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/screens/welcome/components/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: WelcomeBody(),
    );
  }
}
