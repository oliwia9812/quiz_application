import 'package:flutter/material.dart';
import 'package:quizz/styles/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleMedium = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 26.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle customButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: .2,
  );

  static const TextStyle customButtonTitleInGame = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: .2,
  );
  static const TextStyle answerButtonTitle = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: .2,
  );

  static TextStyle subtitle = TextStyle(
    color: Colors.grey.shade400,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  );

  static const TextStyle questionTitle = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
}
