import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_cartridje_mobile/components/info_snackbar.dart';
import 'package:project_cartridje_mobile/models/user_data.dart';
import 'package:project_cartridje_mobile/services/firebase_auth_service.dart';

class FirebaseAuthController extends GetxController {
  FireAuthService fireAuthService =
      FireAuthService(firebaseAuthInstance: FirebaseAuth.instance);

  Rxn<User> user = Rxn(null);
  RxBool busy = false.obs;
  RxBool codeWaiting = false.obs;

  @override
  void onInit() {
    super.onInit();
    // fireAuthService.firebaseAuthInstanse.setSettings(appVerificationDisabledForTesting: true);

    fireAuthService.userStream.listen((User? newUser) async {
      user.value = newUser;
      print(newUser);
      /*if (newUser == null) {
        fireAuthService.signInAnonymously();
      }
      signInWithGoogle();
       fireAuthService.signOut();*/
    });
  }

  signOut() {
    fireAuthService.signOut();
  }

  Future signInByPhone({required String phone}) async {
    print('SignIn by phone > $phone');
    busy.value = true;
    try {
      // Sent sms to user and wait for verification
      await fireAuthService.verifyPhoneNumber(phone).timeout(
          const Duration(seconds: 60),
          onTimeout: () => throw Exception('asd'));
      codeWaiting.value = true;
      busy.value = false;

      InfoSnackBar().infoSnackBar('Tip!', 'Code sended to $phone');
    } catch (e) {
      print('SignIn error');
      InfoSnackBar().errorSnackBar('Error!', e.toString());
      busy.value = false;
    }
  }

  signUp({required UserData userData, required String phone}) async {
    print('SignUp by phone > $phone');
    busy.value = true;
    try {
      // Sent sms to user and wait for verification
      await fireAuthService.verifyPhoneNumber(phone);
      codeWaiting.value = true;
      busy.value = false;
      InfoSnackBar().infoSnackBar('Tip!', 'Code sended to $phone');
    } catch (e) {
      print('SignUp error');
      busy.value = false;
      InfoSnackBar().errorSnackBar('Error!', 'SignUp error');
    }
  }

  verifyNumber({required String number}) async {
    busy.value = true;
    try {
      await fireAuthService.verifyPhoneNumber(number);
      busy.value = false;
      InfoSnackBar().successSnackBar('Tip!', 'Auth done');
      codeWaiting.value = false;
    } catch (e) {
      print('Code verification error');
      busy.value = false;
      InfoSnackBar().errorSnackBar('Error!', 'Code verification error');
    }
  }

  signInByEmail({required String email, required String password}) async {
    busy.value = true;
    try {
      await fireAuthService.signIn(email: email, password: password);
      busy.value = false;

      InfoSnackBar().successSnackBar('Succes!', 'Signed with email');
    } catch (e) {
      print('SignUp error');
      busy.value = false;
      InfoSnackBar().errorSnackBar('Error!', 'SignUp error');
    }
  }

  signUpByEmail({required String email, required String password}) async {
    busy.value = true;
    try {
      // Sent sms to user and wait for verification
      await fireAuthService.signUp(email: email, password: password);
      busy.value = false;

      InfoSnackBar().successSnackBar('Succes!', 'Signed with email');
    } catch (e) {
      print('SignUp error');
      busy.value = false;
      InfoSnackBar().errorSnackBar('Error!', 'SignUp error');
    }
  }
}
