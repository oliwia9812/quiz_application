import 'package:flutter/material.dart';
import 'package:quizz/screens/home_screen.dart';
import 'package:quizz/styles.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: Styles.gradientBackground,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome in quizlette!",
                    style: TextStyle(
                        color: Styles.darkFontColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Image(
                    image: AssetImage('assets/welcome.png'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    style: Styles.buttonStyle,
                    child: const Text(
                      "Start quizz!",
                      style: TextStyle(
                        color: Styles.darkFontColor,
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
