import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olx/screens/accountPage.dart';
import 'package:olx/screens/adPage.dart';
import 'package:olx/screens/chatPage.dart';
import 'package:olx/screens/loginPage.dart';
import 'package:olx/screens/myAdsPage.dart';
import 'package:olx/screens/signupPage.dart';
import 'package:olx/screens/viewProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.green),
      home: SignupPage(),
    );
  }
}
