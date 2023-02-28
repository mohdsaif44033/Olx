import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:olx/controllers/homeController.dart';
import 'package:olx/controllers/userController.dart';
import 'package:olx/models/userModel.dart';
import 'package:olx/screens/loginPage.dart';
import 'package:olx/screens/phoneLogin.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/authController.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpPin = "";

  String countryDial = "+91";
  String phone = "";
  String email = "";
  String name = "";
  String verId = "";
  String isFromLogin = "";

  TextEditingController phoneController = TextEditingController();

  var auth = Get.put(AuthController());

  signUpWithOTP(otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: otp);
    UserCredential usrCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    UserController userController = UserController();
    bool isAdded = await userController.createUser(
        uid: usrCred.user!.uid, name: name, email: email);
    if (isAdded) {
      Get.snackbar("Success", "User Added");
      Get.offAll(() => const PhoneLogin());
    }
  }

  var hc = Get.put(HomeController());

  loginWithOTP(otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: otp);
    UserCredential usrCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    UserController userController = UserController();
    UserModel user = userController.getUser(uid: usrCred.user!.uid);
    if (user != null) {
      hc.user.value = user;
    }
  }

  getRegisterData() {
    print('argument ${Get.arguments}');
    name = Get.arguments[0]["name"];
    email = Get.arguments[1]["email"];
    phone = Get.arguments[2]["phone"];
    verId = Get.arguments[3]['verificationId'];
    isFromLogin = Get.arguments[4]["isFromLogin"];

  }

  void onInitState() {
    getRegisterData();
    print("name:$name, email:$email,phone:$phone");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-vector/cute-hippo-waving-hand-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium_138676-4749.jpg?w=2000"),
                      radius: 100.0,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("We just sent a code to ",
                          style: TextStyle(fontSize: 19, color: Colors.grey)),
                      Text(
                        countryDial + phone,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Enter the code here and Continue",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        PinCodeTextField(
                          appContext: context,
                          length: 6,
                          onChanged: (value) {},
                          pinTheme: PinTheme(
                              activeColor: Colors.black,
                              selectedColor: Colors.blue,
                              inactiveColor: Colors.grey),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Didn't recieve the code?",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.grey)),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Resend',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Material(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                            
                              isFromLogin == "no" ? signUpWithOTP(otpPin): loginWithOTP(otpPin);
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              alignment: Alignment.center,
                              child: const Text(
                                "Verify",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
