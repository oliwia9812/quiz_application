import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color blue = Color(0xFF86A8E7);
  static const Color darkBlue = Color(0xFF262242);
  static const Color green = Color.fromARGB(255, 130, 195, 132);
  static const Color lightGray = Color.fromARGB(255, 241, 241, 241);
  static const Color mint = Color(0xFF91EAE4);
  static const Color red = Color.fromARGB(255, 249, 129, 121);
  static const Color violet = Color(0XFF7F7FD5);
  static const Color yellow = Color(0xFFFFD900);
  static const Color white = Color(0xFFFFFFFF);

  static const LinearGradient gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      violet,
      blue,
      mint,
    ],
  );
}
