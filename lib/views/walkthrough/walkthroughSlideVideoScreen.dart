import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oakam/myFlutterApp.dart';

import 'walkthroughSlideScreen.dart';

class WalkthroughSlideVideoScreen extends WalkthroughSlideScreen {
  final String imagePath;
  final String title;
  final String text;
  final int screenIndex;

  WalkthroughSlideVideoScreen(
      {this.imagePath, this.title, this.text, this.screenIndex}) : super(
      title: title,
      text: text,
      screenIndex: screenIndex,
      image: SvgPicture.asset(imagePath),
      content: Container(
          width: 85,
          height: 85,
          margin: EdgeInsets.all(10),
          child: FloatingActionButton(
              backgroundColor: MyFlutterApp.mainColor,
              onPressed: () {

              },
              child: Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: Colors.white
              )
          )
      )
  );
}