import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Inter',
);
