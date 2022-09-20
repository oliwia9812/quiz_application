import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:quizz/models/question_model.dart';
import 'package:quizz/rest_models/question.dart';
import 'package:quizz/mappers/question_mapper.dart';
import 'package:quizz/presentation/screens/homescreen/widgets/answer_button.dart';

class QuestionList extends StatefulWidget {
  int questionIndex;
  bool selectedAnswer;

  QuestionList({
    Key? key,
    required this.questionIndex,
    required this.selectedAnswer,
  }) : super(key: key);

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuestionModel>>(
      future: fetchJson(),
      builder: ((context, data) {
        List<QuestionModel> list = data.data ?? [];
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData && list.isNotEmpty) {
          QuestionModel question = list[widget.questionIndex];
          return Column(
            children: [
              Text(
                question.question,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              AbsorbPointer(
                absorbing: widget.selectedAnswer,
                child: Column(
                  children: List.generate(question.answers.length, (index) {
                    return AnswerButton(
                      answerText: question.answers[index],
                      correctAnswer: question.correctAnswer,
                      questionIndex: widget.questionIndex,
                      callback: () {
                        setState(() {
                          widget.selectedAnswer = true;
                        });
                      },
                    );
                  }),
                ),
              ),
            ],
          );
        }
        return const Text('Something went wrong!');
      }),
    );
  }

  // Fetch data - LOGIKA
  Future<List<QuestionModel>> fetchJson() async {
    final jsondata = await rootBundle.loadString('assets/questions.json');
    final data = json.decode(jsondata) as List<dynamic>;

    List<Question> list = data.map((e) => Question.fromJson(e)).toList();
    List<QuestionModel> listModelQuestion = list.mapToListQuestionModel();

    return listModelQuestion;
  }
}
