import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:project_cartridje_mobile/components/custom_suffix_icon.dart';
import 'package:project_cartridje_mobile/components/default_button.dart';
import 'package:project_cartridje_mobile/components/form_error.dart';
import 'package:project_cartridje_mobile/config/errors_config.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/controllers/client_controller.dart';
import 'package:project_cartridje_mobile/controllers/firebase_auth_controller.dart';
import 'package:project_cartridje_mobile/models/client.dart';
import 'package:project_cartridje_mobile/screens/home/home_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FirebaseAuthController _firebaseAuthController =
      Get.find<FirebaseAuthController>();
  final ClientController _clientController = Get.find<ClientController>();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? name;
  String? secondName;
  String? password;
  String? confirmPassword;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildSecondNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await _firebaseAuthController.signUpByEmail(
                    email: email!, password: password!);
                if (_firebaseAuthController.user.value != null) {
                  await _clientController.setClientData(
                      newClient: Client(
                          authid: '',
                          firstname: name!,
                          secondName: secondName!,
                          email: email!,
                          birthday: DateTime.now()
                              .subtract(const Duration(days: 5840)),
                          language: 'English',
                          favouriteModel: [],
                          photoURL:
                              'https://firebasestorage.googleapis.com/v0/b/point-citi.appspot.com/o/avatars%2Fdefault_logo.png?alt=media&token=fd454756-b512-4c2f-8f7c-3a585eb1afad',
                          smsNotificationsEnabled: true,
                          emailNotificationsEnabled: true,
                          phoneNumber: "",
                          phoneNumberCountryCode: "",
                          phoneNumberWithoutCounty: "",
                          cardTokens: []));
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(error: matchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if ((password != value)) {
          addError(error: matchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 8) {
          removeError(error: shortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: shortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: invalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: invalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        }
      },
      decoration: const InputDecoration(
        labelText: "Name",
        hintText: "Enter Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurfffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildSecondNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => secondName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        }
      },
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
