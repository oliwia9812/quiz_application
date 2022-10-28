part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetQuestion extends HomeEvent {
  final String? difficulty;

  GetQuestion({required this.difficulty});
}

class GetNextQuestion extends HomeEvent {}

class CheckAnswer extends HomeEvent {
  final String selectedAnswer;

  CheckAnswer({required this.selectedAnswer});
}
