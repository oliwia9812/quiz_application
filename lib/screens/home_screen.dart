import 'package:flutter/material.dart';
import 'package:quizz/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizz/utilities/widgets/answerButton.dart';
import 'package:quizz/utilities/widgets/questionList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Question q1 = Question('q1', ['a1', 'a2', 'a3', 'a4'], 'a2');

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Quizlette',
                    style: TextStyle(
                        color: Styles.darkFontColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 50.0),
                ProgressWidget(),
                const SizedBox(height: 50.0),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 485,
                        decoration: BoxDecoration(
                            color: const Color(0xFFb2f0ec),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 475,
                        decoration: BoxDecoration(
                            color: const Color(0xFFd3f7f4),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 465,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
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
                              height: 12,
                            ),
                            QuestionList(),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                style: Styles.buttonStyle,
                                child: const Text(
                                  'Next question',
                                  style: TextStyle(color: Styles.darkFontColor),
                                ),
                                onPressed: () {
                                  // print(_questions);
                                },
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

class ProgressWidget extends StatefulWidget {
  ProgressWidget({Key? key}) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: const TextSpan(
              style: TextStyle(
                color: Styles.darkFontColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
              children: [
                TextSpan(
                  text: 'Question ',
                ),
                TextSpan(
                  text: '1',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0,
                  ),
                ),
                TextSpan(
                  text: '/5',
                ),
              ]),
        ),
        const SizedBox(
          height: 16,
        ),
        LinearPercentIndicator(
          backgroundColor: Colors.white,
          progressColor: Styles.yellowColor,
          padding: const EdgeInsets.all(0),
          lineHeight: 6.0,
          percent: 0.4,
          barRadius: Radius.circular(10),
        ),
      ],
    );
  }
}
