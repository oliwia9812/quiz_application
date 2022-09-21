import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Question {
  final List<String> answers;
  final String correctAnswer, question;

  Question({
    required this.answers,
    required this.correctAnswer,
    required this.question,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
