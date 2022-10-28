import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/home_bloc.dart';
import 'package:quizz/presentation/screens/question_screen/question_screen.dart';
import 'package:quizz/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:quizz/presentation/widgets/custom_button.dart';
import 'package:quizz/styles/app_colors.dart';
import 'package:quizz/styles/app_text_styles.dart';

class ResultScreen extends StatelessWidget {
  final int finalScore;
  final int questionsAmount;

  const ResultScreen({
    required this.finalScore,
    required this.questionsAmount,
    super.key,
  });

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
            padding:
                const EdgeInsets.symmetric(horizontal: 42.0, vertical: 64.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    const Text(
                      "Quiz result",
                      style: AppTextStyles.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(ResetQuiz());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: _getImage(),
                ),
                Column(
                  children: [
                    Text(
                      _getTitle(),
                      style: AppTextStyles.titleMedium,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Your score: ${_getPercentageScore()}%",
                      style: TextStyle(
                        color: _getColor(),
                        fontWeight: FontWeight.w600,
                        fontSize: 26.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "$finalScore / $questionsAmount answers was correct",
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
                CustomButton(
                  buttonText: "Retake quiz",
                  callback: () {
                    BlocProvider.of<HomeBloc>(context).add(ResetQuiz());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Image _getImage() {
    if (finalScore > questionsAmount / 2) {
      return Image.asset("assets/high-score.png");
    } else {
      return Image.asset("assets/low-score.png");
    }
  }

  String _getTitle() {
    if (finalScore > questionsAmount / 2) {
      return "Congratulation!";
    } else {
      return "Try Again!";
    }
  }

  int _getPercentageScore() {
    return (finalScore * 0.2 * 100).toInt();
  }

  Color _getColor() {
    if (finalScore > questionsAmount / 2) {
      return AppColors.green;
    } else {
      return AppColors.red;
    }
  }
}
