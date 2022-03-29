import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:project_cartridje_mobile/components/info_snackbar.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/controllers/client_controller.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ClientController _clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: _clientController.client!.cardTokens.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(_clientController.client!.cardTokens[index].product.uuid
                  .toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() async {
                  await _clientController.removeProductFromCard(
                      _clientController.client!.cardTokens[index].product);
                  InfoSnackBar().infoSnackBar('Remove from Cart!',
                      'Removed ${_clientController.client!.cardTokens[index].product.title}');
                });
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
              child:
                  CartCard(cart: _clientController.client!.cardTokens[index]),
            ),
          ),
        ),
      );
    });
  }
}
