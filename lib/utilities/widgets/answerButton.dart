import 'package:flutter/material.dart';

enum ButtonState {
  correctAnswer,
  incorrectAnswer,
  noAnswer,
}

class AnswerButton extends StatefulWidget {
  String answerText;
  AnswerButton(this.answerText, {Key? key}) : super(key: key);

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  late ButtonState buttonState = ButtonState.noAnswer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          buttonState = ButtonState.correctAnswer;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: _getBorderColor())),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.widget.answerText,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: _getButtonColor(),
                  border: Border.all(width: 1.4, color: _getBorderColor()),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIcon(),
                  color: Colors.white,
                  size: 16,
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
