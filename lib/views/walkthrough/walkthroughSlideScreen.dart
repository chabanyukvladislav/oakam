import 'package:flutter/material.dart';

import '../slideScreen/slideScreen.dart';

class WalkthroughSlideScreen extends SlideScreen {
  final NetworkImage image;
  final String title;
  final String text;
  final int screenIndex;

  WalkthroughSlideScreen({this.image, this.title, this.text, this.screenIndex}) : super(
    title: title,
    text: text,
    titleStyle: TextStyle(
        fontSize: 25
    ),
    textStyle: TextStyle(
        fontSize: 15
    ),
    content: FadeInImage.assetNetwork(
        image: image.url,
        placeholder: "assets/downloading.gif"
    ),
    screenCount: 3,
    screenIndex: screenIndex,
    selectedDotsColor: Colors.lightBlue,
    unselectedDotsColor: Colors.grey,
  );
}