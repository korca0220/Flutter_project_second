import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
void answerQuestion(){
  print('Print answer');
}

  @override
  Widget build(BuildContext context) {
    var questions = ['What\'s you favorite color?', 'What \s you favorite animal?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Column(children: <Widget>[
          Text('The question!'),
          RaisedButton(
            child: Text('Answer 1'), onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer 2'), onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer 3'), onPressed: answerQuestion,
          )
        ],),
      ),
    );
  }
}
