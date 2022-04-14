import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/api/favourite/favourite.dart';
import 'package:project_cartridje_mobile/components/custom_bottom_nav_bar.dart';
import 'package:project_cartridje_mobile/enums/menu_state_enum.dart';
import 'package:project_cartridje_mobile/models/product.dart';

import 'components/body.dart';

class FavouritesScreen extends StatelessWidget {
  static String routeName = "/favourite";

  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavouriteApi().get(),
      builder: (context, snapshot) {
        List<Product> favourites = [];

        if (snapshot.hasData) {
          favourites.addAll(snapshot.data as List<Product>);
        }

        return Scaffold(
          appBar: buildAppBar(context, favourites.length),
          body: Body(favourites: favourites),
          bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context, int items) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Favourites",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
