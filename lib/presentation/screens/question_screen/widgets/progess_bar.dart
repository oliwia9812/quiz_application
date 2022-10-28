import 'package:flutter/material.dart';
import 'package:quizz/styles/app_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  final int questionNumber;
  final int totalQuestions;

  const ProgressBar({
    Key? key,
    required this.questionNumber,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                children: [
                  const TextSpan(
                    text: 'Question ',
                  ),
                  TextSpan(
                    text: widget.questionNumber.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22.0,
                    ),
                  ),
                  TextSpan(
                    text: '/${widget.totalQuestions}',
                  ),
                ]),
          ),
          const SizedBox(
            height: 16.0,
          ),
          LinearPercentIndicator(
            backgroundColor: Colors.white,
            progressColor: AppColors.yellow,
            padding: const EdgeInsets.all(0.0),
            lineHeight: 6.0,
            percent: (widget.questionNumber / widget.totalQuestions),
            barRadius: const Radius.circular(10.0),
          ),
        ],
      ),
    );
  }
}
