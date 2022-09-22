import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:quizz/mappers/question_mapper.dart';
import 'package:quizz/models/question_model.dart';
import '../rest_models/question.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late List<QuestionModel> questionList;
  int questionNumber = 0;

  HomeBloc() : super(HomeLoading()) {
    on<GetQuestionList>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      questionList = await fetchJson();

      if (questionList.isEmpty) {
        emit(HomeError());
        return;
      }

      add(GetQuestion(firstQuestion: true));
    });

    on<GetQuestion>((event, emit) async {
      if (!event.firstQuestion) {
        questionNumber++;
      }

      emit(HomeLoaded(question: questionList[questionNumber]));
    });

    on<CheckAnswer>((event, emit) async {
      final QuestionModel question = questionList[questionNumber];
      final String selectedAnswer = event.selectedAnswer;
    });
  }
}

Future<List<QuestionModel>> fetchJson() async {
  final jsondata = await rootBundle.loadString('assets/questions.json');
  final data = json.decode(jsondata) as List<dynamic>;

  List<Question> list = data.map((e) => Question.fromJson(e)).toList();
  List<QuestionModel> listModelQuestion = list.mapToListQuestionModel();

  return listModelQuestion;
}
