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
  List<Question>? questionList = [];
  QuestionModel? questionModel;
  late int totalQuestions;

  HomeBloc({required this.questionRepositoryImpl}) : super(QuestionLoading()) {
    on<GetQuestion>(_onGetQuestion);
    on<GetNextQuestion>(_onGetNextQuestion);
    on<CheckAnswer>(_onCheckAnswer);
  }

  void _onCheckAnswer(CheckAnswer event, Emitter<HomeState> emit) {
    final String selectedAnswer = event.selectedAnswer;
    final String correctAnswer = questionList![currentQuestion].correct_answer!;
    late int selectedIndex;

    for (var i = 0; i < questionModel!.answers!.length; i++) {
      if (questionModel!.answers![i].title == selectedAnswer) {
        selectedIndex = i;
      }
    }

    if (selectedAnswer == correctAnswer) {
      questionModel!.answers![selectedIndex].isCorrect = true;
    } else {
      questionModel!.answers![selectedIndex].isCorrect = false;
    }
  }

  Future<void> _onGetQuestion(
      GetQuestion event, Emitter<HomeState> emit) async {
    currentCategory = event.difficulty;

    Results? results =
        await questionRepositoryImpl.fetchResults(difficulty: currentCategory!);

    questionList = results!.results;
    questionModel = questionList![currentQuestion].mapToQuestionModel();

    totalQuestions = questionList!.length;

    emit(
      QuestionLoaded(
        question: QuestionModel(
          correct_answer: questionModel!.correct_answer,
          answers: questionModel!.answers,
          question: questionModel!.question,
        ),
      ),
    );
  }

  void _onGetNextQuestion(GetNextQuestion event, Emitter<HomeState> emit) {
    if (currentQuestion < totalQuestions) {
      currentQuestion++;
    }

    add(GetQuestion(difficulty: currentCategory));
  }
}
