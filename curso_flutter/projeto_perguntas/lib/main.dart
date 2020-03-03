import 'package:flutter/material.dart';
import 'package:projeto_perguntas/quiz.dart';
import 'package:projeto_perguntas/result.dart';

main() => runApp(QuestionsApp());

class _QuestionAppState extends State<QuestionsApp> {
  var _selectedQuestion = 0;
  var _totalPoints = 0;
  var _questions = const [
    {
      'text': 'What is your favourite color?',
      'answers': [
        {'text':'Black','points':10},
        {'text':'Red', 'points':3},
        {'text':'Green','points':5},
        {'text':'White','points':6}
      ]
    },
    {
      'text': 'What is your favourite animal?',
      'answers': [
        {'text':'Snake','points':1},
        {'text':'Rabbit','points':5},
        {'text':'Elephant','points':8},
        {'text':'Lion','points':10},
      ]
    },
    {
      'text': 'What is your favourite month?',
      'answers': [
        {'text':'Jannuary','points':6},
        {'text':'February','points':3},
        {'text':'March','points':8},
        {'text':'August','points':2},
      ]
    },
  ];

  bool get _hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _getResponse(int points) {
    if (_hasSelectedQuestion)
      setState(() {
        _totalPoints+=points;
        _selectedQuestion++;
      });
    print(_selectedQuestion);
  }

  void _restartQuiz(){
    setState(() {
      _selectedQuestion=0;
      _totalPoints=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions?'),
        ),
        body: _hasSelectedQuestion
            ? Quiz(
                answer: _getResponse,
                questions: _questions,
                selectedQuestion: _selectedQuestion,
              )
            : Result(_totalPoints,_restartQuiz),
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
