import 'package:flutter/material.dart';
import 'package:quizz/styles.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback callback;
  final bool isGame;

  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.callback,
      required this.isGame})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        primary: widget.isGame ? Styles.yellowColor : Styles.darkBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
          letterSpacing: .2,
        ),
      ),
      child: Text(
        widget.buttonText,
        style: TextStyle(
          color: widget.isGame ? Styles.darkBlueColor : Styles.whiteColor,
        ),
      ),
      onPressed: () {
        setState(() {
          widget.callback();
        });
      },
    );
  }
}
