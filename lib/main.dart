import 'package:flutter/material.dart';
import 'package:orange_ui_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:orange_ui_app/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
      //Light ThemeData of Application
      theme: lightTheme,
    );
  }
}
