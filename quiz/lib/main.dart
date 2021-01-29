import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answer': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What \'s your favorite animal?',
        'answer': ['Rabbit', 'Snake', 'Dog', 'Cat']
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answer': ['Max', 'Mon', 'Gric', 'Tom']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questiontext: questions[_questionIndex],
            ),
            Answer(onPressed: _answerQuestion),
            Answer(onPressed: _answerQuestion),
            Answer(onPressed: _answerQuestion),
          ],
        ),
      ),
    );
  }
}
