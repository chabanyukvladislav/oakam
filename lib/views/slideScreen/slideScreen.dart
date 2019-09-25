import 'package:flutter/material.dart';

import 'screensDots.dart';

class SlideScreen extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String text;
  final TextStyle textStyle;
  final Widget content;
  final int screenCount;
  final int screenIndex;
  final Color selectedDotsColor;
  final Color unselectedDotsColor;

  SlideScreen({this.title,
    this.titleStyle = const TextStyle(),
    this.text,
    this.textStyle = const TextStyle(),
    this.content,
    this.screenCount,
    this.screenIndex,
    this.selectedDotsColor = Colors.black,
    this.unselectedDotsColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: content
          ),
          Text(
            title,
            style: titleStyle,
          ),
          Container(height: 10),
          Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle
          ),
          Container(height: 10),
          ScreenDots(
            dotsCount: screenCount,
            selectedIndex: screenIndex,
            selectedColor: selectedDotsColor,
            unselectedColor: unselectedDotsColor,
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ]
    );
  }
}