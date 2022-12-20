import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:olx/screens/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:olx/screens/signupPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      // theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
    );
  }
}
