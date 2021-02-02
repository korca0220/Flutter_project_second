import 'dart:convert';
import 'package:quiz_with_django/models/model_quiz.dart';

List<Quiz> parseQuizes(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}
