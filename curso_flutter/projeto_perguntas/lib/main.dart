import 'package:flutter/material.dart';
import 'package:projeto_perguntas/question.dart';
import 'package:projeto_perguntas/answerButton.dart';

main() => runApp(QuestionsApp());

class _QuestionAppState extends State<QuestionsApp> {
  var _selectedQuestion = 0;
  final _questions = [
    'What is your favourite color?',
    'What is your favourite animal?'
  ];
  void _getResponse() {
    setState(() {
      if (_selectedQuestion < _questions.length - 1) _selectedQuestion++;
    });
    print(_selectedQuestion);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions?'),
        ),
        body: Column(
          children: [
            Question(_questions[_selectedQuestion]),
            AnswerButton("Answer 1", _getResponse),
            AnswerButton("Answer 2",_getResponse),
            AnswerButton("Answer 3",_getResponse),
          ],
        ),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
