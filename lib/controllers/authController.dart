import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:olx/screens/HomePage.dart';

class AuthController extends GetxController {
  var firebaseAuth = FirebaseAuth.instance;
  UserCredential? creds;

  signUp({email, pass}) async {
    try {
      creds = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (creds != null) {
        return creds!.user!.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  login({email, pass}) async {
    try {
      creds = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      if (creds != null) {
        print('user id >>>${creds!.user!.uid}');
        return creds!.user!.uid;
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        Get.snackbar('No user found for that email.', "");
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Wrong password provided for that user.', "",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
  }
}
