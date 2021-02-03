import 'package:flutter/material.dart';
import 'package:quiz_with_django/models/api_adapter.dart';
import 'package:quiz_with_django/models/model_quiz.dart';
import 'package:quiz_with_django/screens/quiz_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quiz_with_django/const.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  List<Quiz> quizs;
  _fetchQuizes() async {
    final response =
        await http.get('https://junewoo-drf.herokuapp.com/quiz/3/');
    if (response.statusCode == 200) {
      setState(() {
        quizs = parseQuizes(utf8.decode(response.bodyBytes));
      });
    } else {
      throw Exception('failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'My Quiz App',
            ),
            backgroundColor: Colors.deepPurple,
            leading: Container(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'images/quiz.jpg',
                  width: width * 0.8,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.024),
              ),
              Text(
                '플러터 퀴즈 앱',
                style: TextStyle(
                    fontSize: width * 0.065, fontWeight: FontWeight.bold),
              ),
              Text('퀴즈를 풀기 전 안내사항입니다.\n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요',
                  textAlign: TextAlign.center),
              Padding(
                padding: EdgeInsets.all(width * 0.048),
              ),
              _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
              _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n다음 문제 버튼을 눌러주세요.'),
              _buildStep(width, '3. 만점을 향해 도전해보세요!!.'),
              Padding(padding: EdgeInsets.all(width * 0.048)),
              Container(
                child: Center(
                  child: kColorButton(
                    minimumSize: Size(width * 0.5, height * 0.05),
                    onPrimary: Colors.white,
                    primary: Colors.deepPurple,
                    child: kNormalBoldText(text: '지금 퀴즈 풀기'),
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Row(
                          children: <Widget>[
                            CircularProgressIndicator(),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.036),
                            ),
                            Text('Loading...')
                          ],
                        ),
                      ));
                      _fetchQuizes().whenComplete(() {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return QuizScreen(
                            quizs: quizs,
                          );
                        }), (route) => false);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        children: [
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}
