import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olx/controllers/authController.dart';
import 'package:olx/controllers/userController.dart';
import 'package:olx/screens/HomePage.dart';
import 'package:olx/screens/phoneLogin.dart';
import 'package:olx/screens/signupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String name = "";
  bool changeButton = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var controller = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  Home(),
          ));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                      // child: const CircleAvatar(
                      //   backgroundImage: NetworkImage(
                      //       "https://img.freepik.com/free-vector/cute-hippo-waving-hand-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium_138676-4749.jpg?w=2000"),
                      //   radius: 100.0,
                      // ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome $name",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                hintText: "Email", labelText: "Email"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email cannot be empty";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: passController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Password", labelText: "Password"),
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
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  Get.showOverlay(
                                      asyncFunction: () async {
                                        String? uid = await controller.login(
                                            email: emailController.text,
                                            pass: passController.text);
        
                                        if (uid != null) {
                                          Get.offAll(() =>  Home());
                                           Get.snackbar("Login SUccessful",
                                                "");
                                          // UserModel user = await UserController()
                                          //     .getUser(uid: uid);
                                          // if (user != null) {
                                          //   Get.offAll(() => const Home());
                                          // } else {
                                          //   Get.snackbar("Login Failed",
                                          //       "Go Uninstall It.");
                                          // }
                                        }
                                      },
                                      loadingWidget: const Center(
                                        child: CircularProgressIndicator(),
                                      ));
                                  // print(
                                  //     "TOKEN: ${controller.creds!.credential!.accessToken}");
                                }
                              },
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                height: 50,
                                width: changeButton ? 50 : 150,
                                alignment: Alignment.center,
                                child: changeButton
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                              ),
                            ),
                          ),SizedBox(height: 15,),TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.cyan,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SignupPage()));
                                            },
                                            child: const Text('Not a User? Signup Here'),
                                          ),TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.cyan,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PhoneLogin()));
                                            },
                                            child: const Text('Login With Phone'),
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
      ),
    );
  }
}
