import 'package:flutter/cupertino.dart';
import 'package:project_cartridje_mobile/components/default_button.dart';
import 'package:project_cartridje_mobile/config/colors_config.dart';
import 'package:project_cartridje_mobile/config/durations_config.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/screens/sign_in/sign_in_screen.dart';
import 'package:project_cartridje_mobile/screens/welcome/components/welcome_content.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WelcomeBodyState();
}

class WelcomeBodyState extends State<WelcomeBody> {
  int currentPage = 0;

  List<Map<String, String>> welcomeData = [
    {
      "text": "Welcome, Let’s shop!",
      "image": "assets/images/welcome_screen/welcome_1.png"
    },
    {
      "text": "We help people conect with store \naround World",
      "image": "assets/images/welcome_screen/welcome_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/welcome_screen/welcome_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: welcomeData.length,
                itemBuilder: (context, index) => WelcomeContent(
                  image: welcomeData[index]["image"],
                  text: welcomeData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        welcomeData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}