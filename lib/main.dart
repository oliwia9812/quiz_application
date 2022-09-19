import 'package:flutter/material.dart';
import 'package:quizz/styles.dart';
import './screens/intro_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroScreen(),
  ));
}


// Scaffold(
//       body: Center(
//         child: Container(
//           // decoration: const BoxDecoration(gradient: Styles.gradientBackground),
//           child: const IntroScreen(),
//         ),
//       ),
//     ),