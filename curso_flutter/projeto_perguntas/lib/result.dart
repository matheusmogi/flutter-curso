import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _points;
  final void Function() _restartQuiz;
  Result(this._points, this._restartQuiz);

  String get resultStatement {
    if (_points < 12)
      return "Congratulations!";
    else if (_points < 18)
      return "You rock!";
    else if (_points < 20)
      return "Awesome!";
    else
      return "You rule!";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultStatement,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Center(
          child: Text(
            _points.toString(),
            style: TextStyle(fontSize: 38, color: Colors.red),
          ),
        ),
        Center(
          child: Text(
            "points",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(58.0),
          child: RaisedButton(
            child: Text("Start Again"),
            textColor: Colors.white,
            onPressed: _restartQuiz,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
