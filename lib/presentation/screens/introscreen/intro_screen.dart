import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/home_bloc.dart';
import '../../widgets/custom_button.dart';
import '../../../styles.dart';

import '../homescreen/home_screen.dart';

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
          minimum: const EdgeInsets.all(16.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome in quizlette!",
                    style: TextStyle(
                      color: Styles.darkBlueColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Image(
                    image: AssetImage('assets/welcome.png'),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  CustomButton(
                    buttonText: 'Start Quizz!',
                    callback: () {
                      BlocProvider.of<HomeBloc>(context).add(GetQuestionList());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const HomeScreen()),
                        ),
                      );
                    },
                    isGame: false,
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
