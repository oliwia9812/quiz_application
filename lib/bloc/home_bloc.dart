import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quizz/mappers/question_mapper.dart';
import 'package:quizz/models/question_model.dart';
import 'package:quizz/repository/question_repository_impl.dart';
import '../rest_models/question.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  QuestionRepositoryImpl questionRepositoryImpl;
  int currentQuestion = 0;
  String? currentCategory;
  List<QuestionModel> listQuestionModel = [];
  QuestionModel? questionModel;
  late int totalQuestions;
  int totalScore = 0;

  HomeBloc({required this.questionRepositoryImpl}) : super(QuestionLoading()) {
    on<GetQuestion>(_onGetQuestion);
    on<GetNextQuestion>(_onGetNextQuestion);
    on<CheckAnswer>(_onCheckAnswer);
    on<ResetQuiz>(_onResetQuiz);
  }

  void _onResetQuiz(ResetQuiz event, Emitter<HomeState> emit) {
    currentQuestion = 0;
    totalScore = 0;
  }

  void _onCheckAnswer(CheckAnswer event, Emitter<HomeState> emit) {
    final String selectedAnswer = event.selectedAnswer;
    final String correctAnswer =
        listQuestionModel[currentQuestion].correct_answer!;

    late int selectedIndex;

    for (var i = 0; i < questionModel!.answers!.length; i++) {
      if (listQuestionModel[currentQuestion].answers![i].title ==
          selectedAnswer) {
        selectedIndex = i;
      }
    }

    if (selectedAnswer == correctAnswer) {
      listQuestionModel[currentQuestion].answers![selectedIndex].isCorrect =
          true;
      totalScore++;
    } else {
      listQuestionModel[currentQuestion].answers![selectedIndex].isCorrect =
          false;
    }
  }

  Future<void> _onGetQuestion(
      GetQuestion event, Emitter<HomeState> emit) async {
    currentCategory = event.difficulty;

    Results? results =
        await questionRepositoryImpl.fetchResults(difficulty: currentCategory!);

    List<Question>? questionList = results!.results;

    listQuestionModel = questionList!.mapToListQuestionModel();
    totalQuestions = listQuestionModel.length;

    emit(
      QuestionLoaded(
        question: QuestionModel(
          correct_answer: listQuestionModel[currentQuestion].correct_answer,
          answers: listQuestionModel[currentQuestion].answers,
          question: listQuestionModel[currentQuestion].question,
        ),
      ),
    );
  }

  void _onGetNextQuestion(GetNextQuestion event, Emitter<HomeState> emit) {
    if (currentQuestion + 1 < totalQuestions) {
      currentQuestion++;
    } else {
      emit(QuestionsEnded(totalScore: totalScore));
    }

    emit(
      QuestionLoaded(
        question: QuestionModel(
          correct_answer: listQuestionModel[currentQuestion].correct_answer,
          answers: listQuestionModel[currentQuestion].answers,
          question: listQuestionModel[currentQuestion].question,
        ),
      ),
    );
  }
}
