import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/home_bloc.dart';
import 'package:quizz/presentation/screens/question_screen/question_screen.dart';
import 'package:quizz/presentation/widgets/custom_button.dart';
import 'package:quizz/styles/app_colors.dart';
import 'package:quizz/styles/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientBackground,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 64.0,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome in quizlette!',
                  style: AppTextStyles.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Image(
                    image: AssetImage('assets/welcome.png'),
                  ),
                ),
                CustomButton(
                  buttonText: 'Easy',
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const QuestionScreen()),
                      ),
                    );
                    BlocProvider.of<HomeBloc>(context).add(
                      GetQuestion(difficulty: 'easy'),
                    );
                  },
                ),
                CustomButton(
                  buttonText: 'Medium',
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const QuestionScreen()),
                      ),
                    );
                    BlocProvider.of<HomeBloc>(context).add(
                      GetQuestion(difficulty: 'medium'),
                    );
                  },
                ),
                CustomButton(
                  buttonText: 'Hard',
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const QuestionScreen()),
                      ),
                    );
                    BlocProvider.of<HomeBloc>(context).add(
                      GetQuestion(difficulty: 'hard'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
