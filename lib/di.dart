import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quizz/repository/question_repository_impl.dart';

class DI {
  static final GetIt _getIt = GetIt.instance;
  static final DI _instance = DI._();

  factory DI() => _instance;

  DI._() {
    initDio();
    initQuestionRepository(dio: _getIt.get<Dio>());
  }

  void initDio() {
    final Dio dio = Dio();
    dio.options.baseUrl = "https://opentdb.com/api.php?type=multiple";

    _getIt.registerSingleton(dio);
  }

  void initQuestionRepository({required Dio dio}) {
    _getIt.registerFactory(() => QuestionRepositoryImpl(dio: dio));
  }

  T get<T extends Object>([
    String? instanceName,
  ]) {
    return _getIt.get<T>(
      instanceName: instanceName,
    );
  }
}
