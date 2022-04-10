import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/api/order.dart';
import 'package:project_cartridje_mobile/components/custom_bottom_nav_bar.dart';
import 'package:project_cartridje_mobile/enums/menu_state_enum.dart';
import 'package:project_cartridje_mobile/models/order.dart';

import 'components/body.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = "/orders";

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OrderApi().get(),
      builder: (context, snapshot) {
        List<Order> orders = [];

        if (snapshot.hasData) {
          orders.addAll(snapshot.data as List<Order>);
        }

        return Scaffold(
          appBar: buildAppBar(context, orders.length),
          body: Body(favourites: orders),
          bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.orders),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context, int items) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Orders",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "$items Items",
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
