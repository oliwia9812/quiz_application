import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/home_bloc.dart';
import 'package:quizz/models/question_model.dart';
import 'package:quizz/presentation/screens/homescreen/widgets/answer_button.dart';
import 'package:quizz/presentation/screens/homescreen/widgets/progess_bar.dart';
import 'package:quizz/presentation/widgets/custom_button.dart';

import '../../../styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: ((context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  final QuestionModel questionModel = state.question;
                  return Column(
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
                      // ProgressBar(questionNumber: questionNumber, percent: percent)
                      const SizedBox(height: 50.0),
                      Stack(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                            // height: 465.0,
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
                                  Text(
                                    questionModel.question,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24.0,
                                  ),
                                  Column(
                                    children: List.generate(
                                      questionModel.answers.length,
                                      (index) => AnswerButton(
                                        answerText:
                                            questionModel.answers[index],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CustomButton(
                                      buttonText: 'Next question',
                                      callback: () {
                                        BlocProvider.of<HomeBloc>(context).add(
                                            GetQuestion(firstQuestion: false));
                                      },
                                      isGame: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  return Text(state.toString());
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}















































//   bool _selectedAnswer = false;
//   int _questionIndex = 0;
//   int _totalscore = 0;
  


//                      
//                    
//                                 callback: () {
//                                   setState(() {
//                                     _selectedAnswer = false;

//                                     if (_questionIndex < 4) {
//                                       _questionIndex++;
//                                     } else {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: ((context) => ResultScreen(
//                                                 finalScore: _totalscore,
//                                               )),