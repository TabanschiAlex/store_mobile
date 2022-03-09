import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/components/custom_bottom_nav_bar.dart';
import 'package:project_cartridje_mobile/enums/menu_state_enum.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
