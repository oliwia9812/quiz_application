part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetQuestionList extends HomeEvent {}

class GetQuestion extends HomeEvent {
  bool firstQuestion;

  GetQuestion({required this.firstQuestion});
}

class CheckAnswer extends HomeEvent {
  final String selectedAnswer;

  CheckAnswer({required this.selectedAnswer});
}
