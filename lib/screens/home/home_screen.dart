import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/api/product/product.dart';
import 'package:project_cartridje_mobile/components/custom_bottom_nav_bar.dart';
import 'package:project_cartridje_mobile/enums/menu_state_enum.dart';
import 'package:project_cartridje_mobile/models/product.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductApi().get(),
      builder: (context, snapshot) {
        List<Product> products = [];

        if (snapshot.hasData) {
          products.addAll(snapshot.data as List<Product>);
        }

        return Scaffold(
          body: Body(products: products),
          bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
        );
      },
    );
  }
}
