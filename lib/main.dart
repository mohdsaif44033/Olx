import 'package:flutter/material.dart';
import 'package:olx/screens/accountPage.dart';
import 'package:olx/screens/adPage.dart';
import 'package:olx/screens/chatPage.dart';
import 'package:olx/screens/loginPage.dart';
import 'package:olx/screens/myAdsPage.dart';
import 'package:olx/screens/viewProfile.dart';

import 'screens/HomePage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
      
    );
  }
}