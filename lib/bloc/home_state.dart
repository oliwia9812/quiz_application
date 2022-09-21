part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final QuestionModel question;

  HomeLoaded({required this.question});
}

class HomeError extends HomeState {}
