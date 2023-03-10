import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olx/controllers/authController.dart';
import 'package:olx/screens/otpScreen.dart';

class SignupWithPhone extends StatefulWidget {
  const SignupWithPhone({super.key});

  @override
  State<SignupWithPhone> createState() => SignupWithPhoneState();
}

class SignupWithPhoneState extends State<SignupWithPhone> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var auth = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  const SizedBox(height: 20),
                  Text(
                    "Welcome",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              hintText: "Name", labelText: "Name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name cannot be empty";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: "Email", labelText: "Email"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            } else if (value.length < 6) {
                              return "Email should be legal";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                              hintText: "Phone", labelText: "Phone"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password length should be atleast 6";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Material(
                          color: Colors.cyan,
                          child: InkWell(
                            onTap: () {
                              auth.sendOTP(phoneController.text,
                                  nameController.text, emailController.text);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
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
