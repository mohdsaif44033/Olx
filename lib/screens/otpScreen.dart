import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:olx/screens/loginPage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpPin = "";
 
  String countryDial = "+91";
  String phone = "";
  
 
  TextEditingController phoneController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Row(mainAxisAlignment: MainAxisAlignment.center,
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
                              child: Text('Resend',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
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
