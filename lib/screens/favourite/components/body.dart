import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_cartridje_mobile/components/info_snackbar.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/models/product.dart';

import 'favourite_card.dart';

class Body extends StatelessWidget {
  final List<Product> favourites;

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
            child: Dismissible(
              key: Key(favourites[index].toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                InfoSnackBar().infoSnackBar('Remove from Favourite!',
                    'Removed ${favourites[index].title}');
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
                product: favourites[index],
              ),
            ),
          ),
        ));
  }
}
