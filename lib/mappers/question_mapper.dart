import 'package:quizz/models/question_model.dart';
import '../rest_models/question.dart';

extension QuestionMapper on Question {
  QuestionModel mapToQuestionModel() {
    return QuestionModel(
      answers: answers,
      correctAnswer: correctAnswer,
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
