import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_cartridje_mobile/api/cart/cart.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/models/cart.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
       return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder(
        future: CartApi().get(),
        initialData: const [],
        builder: (context, snapshot) {
          List<Cart> data = [];
          ListView builder;

          if (snapshot.hasData) {
             data.addAll(snapshot.data as List<Cart>);

             builder = ListView.builder(
               itemCount: data.length,
               itemBuilder: (context, index) =>
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: Dismissible(
                       key: Key(data[index].product.id.toString()),
                       direction: DismissDirection.endToStart,
                       onDismissed: (direction) async {
                         final response = await CartApi().deleteItem(data[index].id);

                         if (response) {
                           data.removeAt(index);
                         }
                       },
                       background: Container(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         decoration: BoxDecoration(
                           color: const Color(0xFFFFE6E6),
                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Row(
                           children: [
                             const Spacer(),
                             SvgPicture.asset("assets/icons/Trash.svg"),
                           ],
                         ),
                       ),
                       child: CartCard(cart: data[index]),
                     ),
                   ),
             );
          } else {
            builder = ListView();
          }

          return builder;
        },
      ),
    );
  }
}
