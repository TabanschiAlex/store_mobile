import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_cartridje_mobile/components/info_snackbar.dart';
import 'package:project_cartridje_mobile/models/user_data.dart';
import 'package:project_cartridje_mobile/services/AuthService.dart';

class FirebaseAuthController extends GetxController {
  AuthService authService = AuthService();

  Rxn<User> user = Rxn(null);
  RxBool busy = false.obs;
  RxBool codeWaiting = false.obs;

  @override
  void onInit() {
    super.onInit();

    authService.userStream.listen((User? newUser) async {
      user.value = newUser;
      print(newUser);
    });
  }

  signOut() {
    authService.signOut();
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
      await authService.signUp(email: email, password: password);
      busy.value = false;

      InfoSnackBar().successSnackBar('Succes!', 'Signed with email');
    } catch (e) {
      print('SignUp error');
      busy.value = false;
      InfoSnackBar().errorSnackBar('Error!', 'SignUp error');
    }
  }
}
