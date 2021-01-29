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
  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What \'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Dog', 'Cat']
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': ['Max', 'Mon', 'Gric', 'Tom']
    },
  ];

  void _answerQuestion() {
    setState(() {
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
            : Result(),
      ),
    );
  }
}
