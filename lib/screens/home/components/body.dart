import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/api/product/product.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/models/product.dart';

import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: FutureBuilder(
              future: ProductApi().get(),
              builder: (context, snapshot) {
                List<Product> products = [];

                if (snapshot.hasData) {
                  products.addAll(snapshot.data as List<Product>);
                }

                return Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    const HomeHeader(),
                    SizedBox(height: getProportionateScreenWidth(10)),
                    const DiscountBanner(),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    PopularProducts(products: products),
                    SizedBox(height: getProportionateScreenWidth(30)),
                  ],
                );
              })),
    );
  }
}
