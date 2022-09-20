import 'package:flutter/material.dart';

class Styles {
  static const Color blueColor = Color(0xFF86A8E7);
  static const Color darkBlueColor = Color(0xFF262242);
  static const Color greenColor = Color(0xFF91EAE4);
  static const Color violetColor = Color(0XFF7F7FD5);
  static const Color yellowColor = Color(0xFFFFD900);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const LinearGradient gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      violetColor,
      blueColor,
      greenColor,
    ],
  );
}
