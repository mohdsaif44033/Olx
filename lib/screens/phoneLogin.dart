import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:olx/controllers/authController.dart';
import 'package:olx/screens/otpScreen.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  var auth = Get.put(AuthController());

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
                    // child: const CircleAvatar(
                    //   backgroundImage: NetworkImage(
                    //       "https://img.freepik.com/free-vector/cute-hippo-waving-hand-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium_138676-4749.jpg?w=2000"),
                    //   radius: 100.0,
                    // ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        IntlPhoneField(
                          initialCountryCode: 'IN',
                          showCountryFlag: false,
                          showDropdownIcon: false,
                          controller: phoneController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey, width: 2.0),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: "Phone Number"),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Material(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                              if (phoneController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Phone is still empty!")));
                              } else {
                                auth.verifyPhone(
                                    phoneController.text, "", "", "yes");
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              alignment: Alignment.center,
                              child: const Text(
                                "Get OTP",
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
