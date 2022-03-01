import 'package:flutter/cupertino.dart';
import 'package:project_cartridje_mobile/screens/forgot_password/forgot_password_screen.dart';
import 'package:project_cartridje_mobile/screens/sign_in/sign_in_screen.dart';
import 'package:project_cartridje_mobile/screens/sign_up/sign_up_screen.dart';
import 'package:project_cartridje_mobile/screens/welcome/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
};