import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cartridje_mobile/components/product_card.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/controllers/product_controller.dart';

class Body extends StatelessWidget {
  final AllProducts _productController = Get.find<AllProducts>();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: _productController.foundedProducts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:
                ProductCard(product: _productController.foundedProducts[index]),
          ),
        ),
      );
    });
  }
}
