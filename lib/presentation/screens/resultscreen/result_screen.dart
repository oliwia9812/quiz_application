import 'package:flutter/material.dart';
import '../homescreen/home_screen.dart';
import '../introscreen/intro_screen.dart';
import '../../widgets/custom_button.dart';
import '../../../styles.dart';

enum Score {
  highScore,
  lowScore,
}

class ResultScreen extends StatefulWidget {
  final int finalScore;
  const ResultScreen({Key? key, required this.finalScore}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: Styles.gradientBackground,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 30.0,
                    ),
                    const Text(
                      "Quizz result",
                      style: TextStyle(
                        color: Styles.darkBlueColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const IntroScreen()),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 465.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _getImage(),
                        height: 220.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          _getTitle(),
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'Your score: ${_getPercentScore()}%',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600,
                          color: _getColor(),
                        ),
                      ),
                      Text(
                        '${widget.finalScore}/5 answers was correct',
                        style: const TextStyle(
                          color: Styles.darkBlueColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                CustomButton(
                  buttonText: 'Retake quizz',
                  isGame: false,
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const HomeScreen()),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int _getPercentScore() {
    return (widget.finalScore * 0.2 * 100).toInt();
  }

  String _getImage() {
    if (widget.finalScore > 3) {
      return 'assets/high-score.png';
    } else {
      return 'assets/low-score.png';
    }
  }

  String _getTitle() {
    if (widget.finalScore > 3) {
      return 'Congratulation!';
    } else {
      return 'Try again!';
    }
  }

  Color _getColor() {
    if (widget.finalScore > 3) {
      return Colors.green.shade600;
    } else {
      return Colors.red.shade600;
    }
  }
}
