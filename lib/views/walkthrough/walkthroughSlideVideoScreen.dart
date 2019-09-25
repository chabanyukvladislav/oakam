import 'package:flutter/material.dart';

import '../slideScreen/slideScreen.dart';

class WalkthroughSlideVideoScreen extends SlideScreen {
  final NetworkImage image;
  final String title;
  final String text;
  final int screenIndex;

  WalkthroughSlideVideoScreen({this.image, this.title, this.text, this.screenIndex}) : super(
    title: title,
    text: text,
    titleStyle: TextStyle(
        fontSize: 25
    ),
    textStyle: TextStyle(
        fontSize: 15
    ),
    content: Column(
      children: <Widget>[
        Expanded(
          child: FadeInImage.assetNetwork(
              image: image.url,
              placeholder: "assets/downloading.gif"
          ),
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
                backgroundColor: Colors.lightBlue,
                onPressed: () {

                },
                child: Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: Colors.white,
                )
            )
        )
      ],
    ),
    screenCount: 3,
    screenIndex: screenIndex,
    selectedDotsColor: Colors.lightBlue,
    unselectedDotsColor: Colors.grey,
  );
}