import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Question {
  final String question, correctAnswer;
  final List<String> answers;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
