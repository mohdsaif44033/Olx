import 'package:flutter/material.dart';
import 'package:olx/screens/adPage.dart';
import 'package:olx/screens/chatPage.dart';

import 'screens/HomePage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
      
    );
  }
}