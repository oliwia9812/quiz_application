import 'dart:async';
import 'package:quizz/rest_models/question.dart';

abstract class QuestionRepository {
  Future<Results?>? fetchResults({required String difficulty});
}
