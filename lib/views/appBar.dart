import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  final String title;
  final bool isBackButton;
  final double backButtonIconSize;
  final IconData backButtonIcon;
  final Color backButtonColor;
  final TextStyle titleStyle;
  final List<MaterialButton> buttons;

  AppBar({this.title = "",
    this.isBackButton = false,
    this.backButtonIconSize = 50,
    this.backButtonIcon = Icons.chevron_left,
    this.backButtonColor = Colors.black,
    this.titleStyle = const TextStyle(),
    this.buttons = const <MaterialButton>[]});

  @override
  Widget build(BuildContext context) {
    var rowChild = List<Widget>();
    if (isBackButton)
      rowChild.add(IconButton(
        padding: EdgeInsets.all(0),
        iconSize: backButtonIconSize,
        alignment: Alignment.center,
        color: backButtonColor,
        icon: Icon(
          backButtonIcon
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ));

    rowChild.add(Expanded(
      child: Text(
        title,
        style: titleStyle,
      ),
    ));
    rowChild.addAll(buttons);
    return Row(
        children: rowChild
    );
  }
}