import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/answer.dart';

class Quiz extends StatelessWidget {
  Quiz({this.questions, this.questionIndex, this.onPressed});

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questiontext: questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            onPressed: () => onPressed(answer['score']),
            answerText: answer['text'],
          );
        }).toList()
      ],
    );
  }
}
