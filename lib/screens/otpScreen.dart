import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:olx/screens/loginPage.dart';
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
  String email= "";
  String name = "";

  TextEditingController phoneController = TextEditingController();

  var auth = Get.put(AuthController());

  signIn(otp, verificationId) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    UserCredential usrCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
         var controller = Get.put(AuthController());
  }
 getRegisterData(){
  print('argument ${Get.arguments}');
 name =  Get.arguments[0]["name"];
 email =  Get.arguments[1]["email"];
 phone =  Get.arguments[2]["phone"];
 }
 
 void onInitState(){
  getRegisterData();
 super.initState();
 print("name:$name, email:$email,phone:$phone");}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
                            Text("Didn't recieve the code?",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.grey)),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                              child: Text(
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
                              signIn(822322, auth.verificationIdPhone.value);
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              alignment: Alignment.center,
                              child: const Text(
                                "Register",
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
