import 'package:quizz/models/answer_model.dart';
import '../models/question_model.dart';
import '../rest_models/question.dart';

extension QuestionMapper on Question {
  QuestionModel mapToQuestionModel() {
    List answerList = [...?incorrect_answers, correct_answer!];
    List<AnswerModel> updatedList = [];
    Map<String, dynamic> answersMap = {
      for (var element in answerList) element: null
    };

    answersMap.forEach((key, value) {
      updatedList.add(AnswerModel(title: key, isCorrect: value));
    });

    updatedList.shuffle();

    return QuestionModel(
      correct_answer: correct_answer,
      answers: updatedList,
      question: question,
    );
  }
}

extension QuestionListMapper on List<Question> {
  List<QuestionModel> mapToListQuestionModel() {
    return map(
      (question) => question.mapToQuestionModel(),
    ).toList();
  }
}
