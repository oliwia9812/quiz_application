part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class QuestionLoading extends HomeState {}

class QuestionLoaded extends HomeState {
  final QuestionModel question;

  QuestionLoaded({required this.question});
}

class QuestionsEnded extends HomeState {
  final int totalScore;

  QuestionsEnded({required this.totalScore});
}
