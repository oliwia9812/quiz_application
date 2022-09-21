part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<QuestionModel> questions;

  HomeLoaded({required this.questions});
}

class HomeError extends HomeState {}
