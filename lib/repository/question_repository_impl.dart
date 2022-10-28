import 'package:dio/dio.dart';
import 'package:quizz/repository/question_respository.dart';
import 'package:quizz/rest_models/question.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final Dio dio;

  QuestionRepositoryImpl({required this.dio});

  @override
  Future<Results?>? fetchResults({required String difficulty}) async {
    try {
      late int amount;
      switch (difficulty) {
        case "easy":
          amount = 5;
          break;
        case "medium":
          amount = 10;
          break;
        case "hard":
          amount = 15;
          break;
        default:
      }
      final Response response =
          await dio.get("&amount=$amount&difficulty=$difficulty");
      return Results.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
