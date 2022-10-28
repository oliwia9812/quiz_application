import 'package:flutter/material.dart';
import 'package:quizz/styles/app_decorations.dart';
import 'package:quizz/styles/app_text_styles.dart';

class AnswerButton extends StatefulWidget {
  final String answerTitle;
  final VoidCallback callback;
  bool? isCorrect;
  bool? isSelected;

  AnswerButton({
    required this.answerTitle,
    required this.callback,
    this.isCorrect,
    this.isSelected,
    super.key,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: ElevatedButton(
        style: AppDecorations.answerButtonStyle(widget.isCorrect),
        onPressed: !widget.isSelected! || widget.isCorrect != null
            ? () {
                setState(() {
                  widget.callback();
                });
              }
            : null,
        child: FittedBox(
          child: Text(
            widget.answerTitle,
            style: AppTextStyles.answerButtonTitle,
          ),
        ),
      ),
    );
  }
}
