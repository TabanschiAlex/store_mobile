import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/config/colors_config.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/models/product.dart';
import 'package:project_cartridje_mobile/screens/details/details_screen.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        DetailsScreen.routeName,
        arguments: ProductDetailsArguments(product: product),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: primaryColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
