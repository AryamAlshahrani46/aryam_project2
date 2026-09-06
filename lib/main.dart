import 'package:flutter/material.dart';
import 'package:aryam_project2/Screens/Splash_Screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen() ,
    );
  }
}
