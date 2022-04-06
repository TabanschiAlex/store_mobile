import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_cartridje_mobile/components/info_snackbar.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/controllers/client_controller.dart';
import 'package:project_cartridje_mobile/controllers/product_controller.dart';

import 'favourite_card.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final ClientController _clientController = Get.find<ClientController>();
  final AllProducts _productController = Get.find<AllProducts>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: _clientController.client!.favouriteModel.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(
                  _clientController.client!.favouriteModel[index].toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                // await _clientController.removeProductFromCard(
                //     _clientController.client!.favouriteModel[index]);
                InfoSnackBar().infoSnackBar('Remove from Favourite!',
                    'Removed ${_clientController.client!.favouriteModel[index]}');
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 230, 230, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: FavouriteCard(
                  product: _productController.products.firstWhere((element) =>
                      element.id ==
                      _clientController
                          .client!.favouriteModel[index].productId)),
            ),
          ),
        ),
      );
    });
  }
}
