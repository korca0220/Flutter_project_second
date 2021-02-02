import 'package:flutter/material.dart';

BoxDecoration kPurpleBoxDecoration({Color color = Colors.deepPurple}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.deepPurple));
}
