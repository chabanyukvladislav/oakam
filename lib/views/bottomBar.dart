import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double height;
  final EdgeInsets margin;
  final MaterialButton button;

  BottomBar({this.height = 50,
    this.margin = const EdgeInsets.all(0),
    this.button = const FlatButton(
      child: Text(""),
      onPressed: null,
    )});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: margin,
        child: button
    );
  }
}