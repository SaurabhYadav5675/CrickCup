import 'dart:async';

import 'package:crick_cup/utilities/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FutureOr<UserCredential?> signAnonymous() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      //result.user.uid;
      return result;
    } catch (e) {
      Utility.toastMessage(e.toString());
      return null;
    }
  }

  Stream<User?> Function() getUserData() {
    return _firebaseAuth.authStateChanges;
  }

  Future<UserCredential?> signEmailPassword(
      String email, String password) async {
    print("Data11 sated signEmailPassword");
    try {
      UserCredential? result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (e, s) {
      print("Data11 error in auth $e $s");
      return null;
    }
  }

  FutureOr<UserCredential?> registerEmailPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return result;
    } catch (e) {
      Utility.toastMessage(e.toString());
      return null;
    }
  }
}
