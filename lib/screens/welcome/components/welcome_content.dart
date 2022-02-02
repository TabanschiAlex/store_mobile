import 'package:flutter/material.dart';
import 'package:project_cartridje_mobile/config/colors_config.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "Store",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
