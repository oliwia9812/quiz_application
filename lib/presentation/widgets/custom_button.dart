import 'package:flutter/material.dart';
import 'package:quizz/styles/app_decorations.dart';
import 'package:quizz/styles/app_text_styles.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback callback;
  bool isGame;

  CustomButton({
    required this.buttonText,
    required this.callback,
    this.isGame = false,
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.callback();
        });
      },
      style: AppDecorations.customButtonStyle(widget.isGame),
      child: Text(
        widget.buttonText,
        style: widget.isGame
            ? AppTextStyles.customButtonTitleInGame
            : AppTextStyles.customButtonTitle,
      ),
    );
  }
}
