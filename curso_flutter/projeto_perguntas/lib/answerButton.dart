import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final void Function() onAnswered;
  AnswerButton(this.text, this.onAnswered);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(text),
        onPressed:onAnswered,
      ),
    );
  }
}
