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
  HomeBloc() : super(HomeInitial()) {
    on<GetQuestionList>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(Duration(seconds: 2));
      List<QuestionModel> questionList = await fetchJson();

      if (questionList.isEmpty) {
        emit(HomeError());
        return;
      }

      emit(HomeLoaded(questions: questionList));
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
