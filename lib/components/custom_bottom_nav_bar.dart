import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_cartridje_mobile/config/colors_config.dart';
import 'package:project_cartridje_mobile/enums/menu_state_enum.dart';
import 'package:project_cartridje_mobile/helper/local_storage.dart';
import 'package:project_cartridje_mobile/screens/favourite/favourites_screen.dart';
import 'package:project_cartridje_mobile/screens/home/home_screen.dart';
import 'package:project_cartridje_mobile/screens/orders/orders_screen.dart';
import 'package:project_cartridje_mobile/screens/sign_in/sign_in_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/shop_icon.svg",
                  color: MenuState.home == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/heart_icon.svg"),
                color: MenuState.favourite == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
                onPressed: () =>
                    Navigator.pushNamed(context, FavouritesScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/chat_bubble_icon.svg"),
                color: MenuState.orders == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
                onPressed: () {
                  Navigator.pushNamed(context, OrdersScreen.routeName);
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Logout.svg",
                    color: MenuState.profile == selectedMenu
                        ? primaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Storage.set('token', null);
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  }),
            ],
          )),
    );
  }
}
