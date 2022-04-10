import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/models/order.dart';
import 'package:project_cartridje_mobile/screens/orders/components/order_card.dart';

class Body extends StatelessWidget {
  final List<Order> favourites;

  const Body({Key? key, required this.favourites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: OrderCard(
            order: favourites[index],
          ),
        ),
      ),
    );
  }
}
