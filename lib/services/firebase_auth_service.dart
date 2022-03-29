import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FireAuthService {
  final FirebaseAuth firebaseAuthInstance;

  FireAuthService({
    required this.firebaseAuthInstance,
  });

  FirebaseAuth get _firebaseAuth => firebaseAuthInstance;

  User? get user => FirebaseAuth.instance.currentUser;

  Stream<User?> get userStream =>
      FirebaseAuth.instance.userChanges().asBroadcastStream();

  Future registrationByMail(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return Future.error(e);
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<UserCredential?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return Future.error(e);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return Future.error(e);
      }
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<UserCredential?> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return Future.error(e);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return Future.error(e);
      }
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  String _verificationCode = "";

  Future verifyPhoneNumber(String phoneNumber) async {
    Completer completer = Completer();

    _smsCodeSent(String verificationCode) {
      print('pho sent');
      _verificationCode = verificationCode;
      completer.complete();
    }

    _verificationFailed(authException) {
      print('pho failed');
      completer.completeError(authException.toString());
    }

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 0),
        verificationCompleted: (authCredential) => {},
        verificationFailed: (authException) =>
            _verificationFailed(authException),
        codeAutoRetrievalTimeout: (verificationId) => {},
        codeSent: (verificationId, c) => _smsCodeSent(verificationId));

    return completer.future;
  }

  Future<UserCredential> signInAnonymously() async {
    return await FirebaseAuth.instance.signInAnonymously();
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
  }
}
