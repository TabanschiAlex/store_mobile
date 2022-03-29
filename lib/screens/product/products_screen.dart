import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cartridje_mobile/components/custom_bottom_nav_bar.dart';
import 'package:project_cartridje_mobile/controllers/product_controller.dart';
import 'package:project_cartridje_mobile/enums/menu_state_enum.dart';

import 'components/body.dart';
import 'components/search.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = "/products";
  final AllProducts _productController = Get.find<AllProducts>();

  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
      endDrawer: const Search(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Products",
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            return Text(
              "${_productController.foundedProducts.length} " + "CT_items".tr,
              style: Theme.of(context).textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}
