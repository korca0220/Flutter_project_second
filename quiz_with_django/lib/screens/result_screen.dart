import 'package:flutter/material.dart';
import 'package:quiz_with_django/models/model_quiz.dart';
import 'package:quiz_with_django/screens/home_screen.dart';
import 'package:quiz_with_django/const.dart';

class ResultScreen extends StatelessWidget {
  final List<Quiz> quizs;
  final List<int> answers;
  ResultScreen({this.quizs, this.answers});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    int _socre = 0;

    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].answer == answers[i]) {
        _socre += 1;
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Container(
              width: width * 0.8,
              height: height * 0.45,
              decoration: kPurpleBoxDecoration(),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                  ),
                  Container(
                    decoration: kPurpleBoxDecoration(color: Colors.white),
                    width: width * 0.70,
                    height: height * 0.24,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: width * 0.02, bottom: width * 0.012),
                          child: Text(
                            '수고하셨습니다 !',
                            style: TextStyle(
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '당신의 점수는',
                          style: TextStyle(
                            fontSize: width * 0.048,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          _socre.toString() + '/' + quizs.length.toString(),
                          style: TextStyle(
                            fontSize: width * 0.21,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(width * 0.7, height * 0.05),
                          onPrimary: Colors.black,
                          primary: Colors.white),
                      child: Text(
                        '처음으로 돌아가기',
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }), (route) => false);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: width * 0.045),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
