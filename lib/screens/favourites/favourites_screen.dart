import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  static String routeName = "/favourites";
  ClientController _clientController = Get.find<ClientController>();

  FavouritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar:
      CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "FV_title".tr,
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            return Text(
              "${_clientController.client!.favouriteModel.length} " +
                  "CT_items".tr,
              style: Theme.of(context).textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}