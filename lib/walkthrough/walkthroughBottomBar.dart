import 'package:flutter/material.dart';

class WalkthroughBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30
        ),
        child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50)
            ),
            color: Colors.lightBlue,
            textColor: Colors.white,
            child: Container(
                child: Text(
                    "Learn more",
                    style: TextStyle(
                        fontSize: 20
                    )
                )
            ),
            onPressed: _onInfoPress
        )
    );
  }

  void _onInfoPress() {

  }
}