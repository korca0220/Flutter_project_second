import 'package:flutter/material.dart';
import 'package:quiz_with_django/models/model_quiz.dart';
import 'package:quiz_with_django/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<Quiz> quizs;
  ResultScreen({this.quizs});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    int _socre = 0;
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
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.deepPurple),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.deepPurple),
                    ),
                    width: width * 0.70,
                    height: height * 0.24,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: width * 0.048, bottom: width * 0.012),
                          child: Text(
                            '수고하셨습니다',
                            style: TextStyle(
                              fontSize: width * 0.055,
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
