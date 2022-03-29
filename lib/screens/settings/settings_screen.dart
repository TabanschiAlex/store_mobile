import 'package:flutter/material.dart';

import 'components.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Settings",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
