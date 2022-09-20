import 'package:flutter/material.dart';
import 'package:quizz/presentation/screens/homescreen/widgets/progess_bar.dart';
import 'package:quizz/presentation/screens/homescreen/widgets/question_list.dart';
import 'package:quizz/presentation/screens/resultscreen/result_screen.dart';
import 'package:quizz/presentation/widgets/custom_button.dart';
import 'package:quizz/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _selectedAnswer = false;
  int _questionIndex = 0;

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
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Quizlette',
                    style: TextStyle(
                      color: Styles.darkBlueColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                ProgressBar(
                  percent: (_questionIndex + 1) * 0.2,
                  questionNumber: _questionIndex + 1,
                ),
                const SizedBox(height: 50.0),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 485.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFb2f0ec),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: double.infinity,
                        height: 475.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFd3f7f4),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 465.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select an answer",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            QuestionList(
                              questionIndex: _questionIndex,
                              selectedAnswer: _selectedAnswer,
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CustomButton(
                                buttonText: 'Next Question',
                                callback: () {
                                  setState(() {
                                    _selectedAnswer = false;

                                    if (_questionIndex < 4) {
                                      _questionIndex++;
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              const ResultScreen()),
                                        ),
                                      );
                                    }
                                  });
                                },
                                isGame: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
