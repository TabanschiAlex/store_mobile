import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/components/product_card.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/models/product.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final List<Product> products;

  PopularProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                  return ProductCard(product: products[index]);

                  /*if (demoProducts[index].isPopular) {
                          return ProductCard(product: demoProducts[index]);
                        }

                        return const SizedBox
                            .shrink();*/
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
