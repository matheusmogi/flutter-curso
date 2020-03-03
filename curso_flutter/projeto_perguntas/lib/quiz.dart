import 'package:flutter/material.dart';
import 'package:projeto_perguntas/answerButton.dart';
import 'package:projeto_perguntas/question.dart';

// class Quiz extends StatelessWidget {
//   List<Widget> _answers = [];

//   var _questions ;
//   Quiz(this._questions, this._answers);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [Question(_questions), ..._answers],
//     );
//   }
// }
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  Quiz(
      {@required this.questions,
      @required this.selectedQuestion,
      @required this.answer});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> answers =
        hasSelectedQuestion ? questions[selectedQuestion]['answers'] : null;
    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text']),
        ...answers
            .map((a) => AnswerButton(a['text'], () => answer(a['points'])))
            .toList(),
      ],
    );
  }

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }
}
