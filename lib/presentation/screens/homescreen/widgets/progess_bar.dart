import 'package:flutter/material.dart';
import 'package:quizz/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  int questionNumber;
  double percent;

  ProgressBar({Key? key, required this.questionNumber, required this.percent})
      : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              style: const TextStyle(
                color: Styles.darkBlueColor,
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
                const TextSpan(
                  text: '/5',
                ),
              ]),
        ),
        const SizedBox(
          height: 16.0,
        ),
        LinearPercentIndicator(
          backgroundColor: Colors.white,
          progressColor: Styles.yellowColor,
          padding: const EdgeInsets.all(0.0),
          lineHeight: 6.0,
          percent: widget.percent,
          barRadius: const Radius.circular(10.0),
        ),
      ],
    );
  }
}
