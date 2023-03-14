import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:olx/screens/otpScreen.dart';

class AuthController extends GetxController {
  var firebaseAuth = FirebaseAuth.instance;
  UserCredential? creds;
  RxString verificationIdPhone = "".obs;

  signUp({email, pass}) async {
    try {
      creds = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (creds != null) {
        return creds!.user!.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "Password is very weak, try again");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", 'The account already exists for that email.');
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

  Future<void> verifyPhone(
      String number, String name, String email, String isFromLogin) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$number",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        print("VarifyID: $verificationId");
        Get.to(() => const OtpScreen(), arguments: [
          {"name": name},
          {"email": email},
          {"phone": number},
          {"verificationId": verificationId},
          {"isFromLogin": isFromLogin}
        ]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
