import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:project_cartridje_mobile/controllers/firebase_auth_controller.dart';
import 'package:project_cartridje_mobile/screens/settings/settings_screen.dart';
import 'package:project_cartridje_mobile/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final FirebaseAuthController _firebaseAuthController =
      Get.find<FirebaseAuthController>();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User_2.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () => Navigator.pushNamed(
              context,
              SettingsScreen.routeName,
            ),
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Logout.svg",
            press: () async {
              await _firebaseAuthController.signOut();
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
