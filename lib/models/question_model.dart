import 'package:equatable/equatable.dart';
import 'package:quizz/models/answer_model.dart';

class QuestionModel extends Equatable {
  String? correct_answer;
  List<AnswerModel>? answers;
  String? question;

  QuestionModel({
    required this.correct_answer,
    required this.answers,
    required this.question,
  });

  @override
  List<Object?> get props => [
        correct_answer,
        answers,
        question,
      ];
}
