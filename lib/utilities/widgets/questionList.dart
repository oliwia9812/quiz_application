import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:quizz/models/question_model.dart';
import 'package:quizz/rest_models/question.dart';
import 'package:quizz/utilities/widgets/answerButton.dart';
import '../../mappers/question_mapper.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  int questionIndex = 0;

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
          QuestionModel question = list[questionIndex];

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
              Column(
                children: List.generate(question.answers.length, (index) {
                  return AnswerButton(question.answers[index]);
                }),
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
