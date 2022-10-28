import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/home_bloc.dart';
import 'package:quizz/models/question_model.dart';
import 'package:quizz/presentation/screens/question_screen/widgets/answer_button.dart';
import 'package:quizz/presentation/screens/question_screen/widgets/progess_bar.dart';
import 'package:quizz/presentation/widgets/custom_button.dart';
import 'package:quizz/styles/app_colors.dart';
import 'package:quizz/styles/app_text_styles.dart';
import 'package:quizz/extensions/encode_text.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

bool? _isSelected = false;

class _QuestionScreenState extends State<QuestionScreen> {
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
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is QuestionLoading) {
                return _buildLoading();
              }
              if (state is QuestionLoaded) {
                return _buildQuestionView(state.question, context);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.violet,
      ),
    );
  }

  Widget _buildQuestionView(QuestionModel question, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Quizlette",
          style: AppTextStyles.titleMedium,
        ),
        ProgressBar(
          questionNumber:
              BlocProvider.of<HomeBloc>(context).currentQuestion + 1,
          totalQuestions: BlocProvider.of<HomeBloc>(context).totalQuestions,
        ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Select an answer",
                      style: AppTextStyles.subtitle,
                    ),
                    _buildQuestionTitle(question),
                    _buildAnswers(question, context),
                    _buildNextQuestionButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestionTitle(QuestionModel question) {
    return Text(
      question.question!.encodeText(),
      style: AppTextStyles.questionTitle,
    );
  }

  Widget _buildAnswers(QuestionModel question, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: List.generate(question.answers!.length, (index) {
          return AnswerButton(
            callback: () {
              setState(() {
                BlocProvider.of<HomeBloc>(context).add(
                  CheckAnswer(selectedAnswer: question.answers![index].title!),
                );
                _isSelected = true;
              });
            },
            answerTitle: question.answers![index].title!.encodeText(),
            isCorrect: question.answers![index].isCorrect,
            isSelected: _isSelected,
          );
        }),
      ),
    );
  }

  Widget _buildNextQuestionButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CustomButton(
        isGame: true,
        buttonText: "Next question",
        callback: () {
          BlocProvider.of<HomeBloc>(context).add(GetNextQuestion());
          _isSelected = false;
        },
      ),
    );
  }
}
