import 'package:flutter/material.dart';

import 'bottomBar.dart';

class NavigateBottomBar extends BottomBar {
  final String text;
  final Color fontColor;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Function onButtonPressed;

  NavigateBottomBar({this.text,
    this.fontColor = Colors.white,
    this.backgroundColor = Colors.black,
    this.textStyle = const TextStyle(),
    this.onButtonPressed}) : super(
      button: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50)
          ),
          color: backgroundColor,
          textColor: fontColor,
          child: Container(
              child: Text(
                  text,
                  style: textStyle
              )
          ),
          onPressed: onButtonPressed
      )
  );
}