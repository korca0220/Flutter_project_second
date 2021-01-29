import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressed;
  Answer({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text('Answer 1'),
        onPressed: onPressed,
      ),
    );
  }
}
