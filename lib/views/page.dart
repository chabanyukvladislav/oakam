import 'package:flutter/material.dart';

import 'appBar.dart' as custom;

class Page extends StatelessWidget{
  final custom.AppBar appBar;
  final Widget body;
  final Widget bottomNavigationBar;

  Page({this.appBar, this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery
                .of(context)
                .size
                .width, 50),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              height: 50,
              child: appBar
            )
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: body
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: bottomNavigationBar
        )
    );
  }
}