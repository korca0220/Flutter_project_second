import 'package:flutter/material.dart';

BoxDecoration kPurpleBoxDecoration({Color color = Colors.deepPurple}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.deepPurple));
}

ElevatedButton kColorButton(
    {Size minimumSize,
    Color onPrimary,
    Color primary,
    Widget child,
    Function onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: child,
    style: ElevatedButton.styleFrom(
        minimumSize: minimumSize, onPrimary: onPrimary, primary: primary),
  );
}

ElevatedButton kShapeButton(
    {Size minimumSize,
    Color onPrimary,
    Color primary,
    Widget child,
    Function onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: child,
    style: ElevatedButton.styleFrom(
        minimumSize: minimumSize,
        onPrimary: onPrimary,
        primary: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
  );
}

Widget kNormalBoldText({String text}) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}
