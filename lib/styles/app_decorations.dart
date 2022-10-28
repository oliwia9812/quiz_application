import 'package:flutter/material.dart';
import 'package:quizz/styles/app_colors.dart';

abstract class AppDecorations {
  static ButtonStyle customButtonStyle(bool isGame) => ElevatedButton.styleFrom(
        backgroundColor: isGame ? AppColors.yellow : AppColors.darkBlue,
        minimumSize: isGame
            ? const Size(128.0, 40.0)
            : const Size(double.infinity, 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      );

  static ButtonStyle answerButtonStyle(bool? isCorrect) =>
      ElevatedButton.styleFrom(
        backgroundColor: _getAnswerButtonColor(isCorrect),
        minimumSize: const Size(double.infinity, 40.0),
        disabledBackgroundColor: AppColors.lightGray,
        elevation: 3,
        shadowColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
          color: AppColors.darkBlue.withOpacity(0.4),
        ),
      );

  static Color _getAnswerButtonColor(bool? isCorrect) {
    switch (isCorrect) {
      case null:
        return AppColors.white;
      case true:
        return AppColors.green;
      case false:
        return AppColors.red;
      default:
        return AppColors.white;
    }
  }
}
