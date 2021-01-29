import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function onPressed;
  Result({this.totalScore, this.onPressed});

  String get resultPhrase {
    var resultText = 'You did it!';
    if (totalScore <= 10) {
      resultText = 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (totalScore <= 15) {
      resultText = 'You are... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.blue,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
