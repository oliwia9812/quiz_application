import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz/bloc/home_bloc.dart';

enum ButtonState {
  correctAnswer,
  incorrectAnswer,
  noAnswer,
}

class AnswerButton extends StatefulWidget {
  final String answerText;

  AnswerButton({
    Key? key,
    required this.answerText,
  }) : super(key: key);

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  ButtonState buttonState = ButtonState.noAnswer;
  bool answerIsCorrect = false;

  // @override
  // void didUpdateWidget(covariant AnswerButton oldWidget) {
  //   if (widget.questionIndex != oldWidget.questionIndex) {
  //     buttonState = ButtonState.noAnswer;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          BlocProvider.of<HomeBloc>(context)
              .add(CheckAnswer(selectedAnswer: widget.answerText));
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1,
            color: _getBorderColor(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.answerText,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800,
                ),
              ),
              Container(
                height: 24.0,
                width: 24.0,
                decoration: BoxDecoration(
                  color: _getButtonColor(),
                  border: Border.all(
                    width: 1.4,
                    color: _getBorderColor(),
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIcon(),
                  color: Colors.white,
                  size: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _getButtonColor() {
    switch (buttonState) {
      case ButtonState.correctAnswer:
        return Colors.green;
      case ButtonState.incorrectAnswer:
        return Colors.red;
      case ButtonState.noAnswer:
        return Colors.transparent;
    }
  }

  Color _getBorderColor() {
    switch (buttonState) {
      case ButtonState.correctAnswer:
        return Colors.green;
      case ButtonState.incorrectAnswer:
        return Colors.red;
      case ButtonState.noAnswer:
        return Colors.grey.shade400;
    }
  }

  IconData? _getIcon() {
    switch (buttonState) {
      case ButtonState.correctAnswer:
        return Icons.check;
      case ButtonState.incorrectAnswer:
        return Icons.close;
      case ButtonState.noAnswer:
        return null;
    }
  }
}
