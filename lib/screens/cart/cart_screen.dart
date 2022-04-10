import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/api/cart/cart.dart';
import 'package:project_cartridje_mobile/models/cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CartApi().get(),
      builder: (context, snapshot) {
        List<Cart> data = [];
        double totalPrice = 0.00;

        if (snapshot.hasData) {
          data.addAll(snapshot.data as List<Cart>);
        }

        if (data.isNotEmpty) {
          totalPrice = data.map((e) => e.numOfItem * e.product.price).reduce((value, element) => value + element);
        }

        return Scaffold(
          appBar: buildAppBar(context, data.length),
          body: Body(data: data),
          bottomNavigationBar: CheckoutCard(price: totalPrice),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context, items) {
    return AppBar(
        title: Column(children: [
      const Text(
        "Your Cart",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        "$items items",
        style: Theme.of(context).textTheme.caption,
      )
    ]));
  }
}
