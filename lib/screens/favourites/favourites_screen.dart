import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cartridje_mobile/components/custom_bottom_nav_bar.dart';
import 'package:project_cartridje_mobile/controllers/client_controller.dart';
import 'package:project_cartridje_mobile/enums/menu_state_enum.dart';

import 'components/body.dart';

class FavouritesScreen extends StatelessWidget {
  static String routeName = "/favourite";
  final ClientController _clientController = Get.find<ClientController>();

  FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Favourites",
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            return Text(
              "${_clientController.client!.favouriteModel.length} Items",
              style: Theme.of(context).textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}
