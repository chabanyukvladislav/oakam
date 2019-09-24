import 'package:flutter/material.dart';

class ScreenDots extends StatelessWidget {
  final int dotsCount;
  final int selectedIndex;
  final Color selectedColor;
  final Color unselectedColor;
  final MainAxisAlignment mainAxisAlignment;

  ScreenDots(
      {this.dotsCount, this.selectedIndex, this.selectedColor, this.unselectedColor, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    var dots = List<Widget>();
    for (int i = 0; i < dotsCount; ++i) {
      Color color = i == selectedIndex ? selectedColor : unselectedColor;
      Icon icon = Icon(
        Icons.brightness_1,
        size: 10,
        color: color,
      );
      dots.add(icon);
      if (i != dotsCount - 1)
        dots.add(Container(width: 5));
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: dots,
    );
  }
}