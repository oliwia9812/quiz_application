import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Results {
  int? response_code;
  List<Question>? results;

  Results({
    required this.response_code,
    required this.results,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Question {
  String? category;
  String? correct_answer;
  String? difficulty;
  List<String>? incorrect_answers;
  String? question;
  String? type;

  Question({
    required this.category,
    required this.correct_answer,
    required this.difficulty,
    required this.incorrect_answers,
    required this.question,
    required this.type,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
