import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/home_bloc.dart';
import 'package:quizz/di.dart';
import 'package:quizz/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:quizz/repository/question_repository_impl.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(questionRepositoryImpl: DI().get<QuestionRepositoryImpl>()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
