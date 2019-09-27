import 'package:flutter/material.dart';

import 'screensDots.dart';

class SlideScreen extends StatelessWidget {
  final Widget image;
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
    this.image,
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
              flex: 3,
              child: Container(
                  child: image
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: content,
              )
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: titleStyle,
                ),
                Container(height: 15),
                Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle
                ),
                Container(height: 20),
                ScreenDots(
                  dotsCount: screenCount,
                  selectedIndex: screenIndex,
                  selectedColor: selectedDotsColor,
                  unselectedColor: unselectedDotsColor,
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          )
        ]
    );
  }
}