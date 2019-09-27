import 'package:flutter/material.dart';
import 'package:oakam/myFlutterApp.dart';

import '../slideScreen/slideScreen.dart';

class WalkthroughSlideScreen extends SlideScreen {
  final Widget image;
  final String title;
  final String text;
  final int screenIndex;
  final Widget content;

  WalkthroughSlideScreen({this.image, this.title, this.text, this.screenIndex, this.content})
      : super(
    title: title,
    text: text,
    titleStyle: TextStyle(
        fontSize: 24,
        fontFamily: "Proxima Nova Soft Bold",
        color: MyFlutterApp.titleColor,
        letterSpacing: 0.4
    ),
    textStyle: TextStyle(
        fontSize: 17,
        fontFamily: "SF Pro Display Regular",
        color: MyFlutterApp.textColor,
        letterSpacing: 0.5
    ),
    image: image,
    content: content,
    screenCount: 3,
    screenIndex: screenIndex,
    selectedDotsColor: MyFlutterApp.mainColor,
    unselectedDotsColor: MyFlutterApp.unselectedColor,
  );
}