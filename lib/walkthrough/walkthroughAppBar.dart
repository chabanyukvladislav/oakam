import 'package:flutter/material.dart';

class WalkthroughAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        child: FlatButton(
          color: Colors.transparent,
          textColor: Colors.lightBlue,
          child: Text(
            "Skip",
            style: TextStyle(
                fontSize: 15
            ),
          ),
          onPressed: _onSkipPress,
        )
    );
  }

  void _onSkipPress() {

  }
}