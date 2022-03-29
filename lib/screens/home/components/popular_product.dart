import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:project_cartridje_mobile/components/product_card.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/controllers/product_controller.dart';
import 'package:project_cartridje_mobile/screens/product/products_screen.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final AllProducts _productController = Get.find<AllProducts>();

  PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(
                title: "Popular products",
                press: () =>
                    Navigator.pushNamed(context, ProductsScreen.routeName)),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  _productController.products.length,
                  (index) {
                    if (_productController.products[index].isPopular) {
                      return ProductCard(
                          product: _productController.products[index]);
                    }

                    return const SizedBox.shrink();
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          )
        ],
      );
    });
  }
}
