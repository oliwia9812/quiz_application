import 'package:quizz/models/question_model.dart';
import '../rest_models/question.dart';

extension QuestionMapper on Question {
  QuestionModel mapToQuestionModel() {
    return QuestionModel(
      question: question,
      answers: answers,
      correctAnswer: correctAnswer,
    );
  }
}

extension QuestionListMapper on List<Question> {
  List<QuestionModel> mapToListQuestionModel() {
    return map((question) => question.mapToQuestionModel()).toList();
  }
}
