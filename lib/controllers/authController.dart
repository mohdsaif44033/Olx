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
        Get.offAll(() => const Home());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        login(email: email, pass: pass);
      }
    } catch (e) {
      print(e);
    }
  }

  login({email, pass}) async {
    try {
      creds = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      Get.offAll(() => const Home());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }
}
