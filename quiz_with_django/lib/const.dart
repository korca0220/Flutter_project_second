import 'package:flutter/material.dart';

BoxDecoration kPurpleBoxDecoration({Color color = Colors.deepPurple}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.deepPurple));
}

ElevatedButton kColorButton(
    {double width,
    double height,
    Color onPrimary,
    Color primary,
    Widget child,
    Function onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: child,
    style: ElevatedButton.styleFrom(
        minimumSize: Size(width * 0.5, height * 0.05),
        onPrimary: onPrimary,
        primary: primary),
  );
}

Widget kNormalBoldText({String text}) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}
