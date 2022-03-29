import 'package:flutter/cupertino.dart';
import 'package:project_cartridje_mobile/screens/cart/cart_screen.dart';
import 'package:project_cartridje_mobile/screens/details/details_screen.dart';
import 'package:project_cartridje_mobile/screens/favourites/favourites_screen.dart';
import 'package:project_cartridje_mobile/screens/forgot_password/forgot_password_screen.dart';
import 'package:project_cartridje_mobile/screens/home/home_screen.dart';
import 'package:project_cartridje_mobile/screens/login_success/login_success_screen.dart';
import 'package:project_cartridje_mobile/screens/product/products_screen.dart';
import 'package:project_cartridje_mobile/screens/profile/profile_screen.dart';
import 'package:project_cartridje_mobile/screens/settings/settings_screen.dart';
import 'package:project_cartridje_mobile/screens/sign_in/sign_in_screen.dart';
import 'package:project_cartridje_mobile/screens/sign_up/sign_up_screen.dart';
import 'package:project_cartridje_mobile/screens/welcome/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  FavouritesScreen.routeName: (context) => FavouritesScreen(),
  ProductsScreen.routeName: (context) => ProductsScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
};
