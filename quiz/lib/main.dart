import 'package:flutter/material.dart';
import 'package:quiz/result.dart';
import 'package:quiz/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 7},
        {'text': 'White', 'score': 8},
      ]
    },
    {
      'questionText': 'What \'s your favorite animal?',
      'answers': [
        {'text': 'Pig', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 2},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 5},
        {'text': 'Mon', 'score': 8},
        {'text': 'Gric', 'score': 3},
        {'text': 'Tom', 'score': 2},
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                onPressed: _answerQuestion,
              )
            : Result(
                totalScore: _totalScore,
              ),
      ),
    );
  }
}
