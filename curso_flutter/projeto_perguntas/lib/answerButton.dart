import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String _text;
  final void Function() _onAnswered;
  AnswerButton(this._text, this._onAnswered);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.red[900],
        textColor: Colors.white,
        child: Text(_text),
        onPressed:_onAnswered,
      ),
    );
  }
}
