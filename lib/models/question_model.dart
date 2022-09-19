class QuestionModel {
  final String question, correctAnswer;
  final List<String> answers;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}
