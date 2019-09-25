import 'package:flutter/material.dart';

import '../about/aboutPage.dart';
import '../navigateBottomBar.dart';
import 'walkthroughBody.dart';
import '../page.dart';
import '../appBar.dart' as custom;

class WalkthroughPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Page(
      appBar: custom.AppBar(
        buttons: <MaterialButton>[
          FlatButton(
            color: Colors.transparent,
            textColor: Colors.lightBlue,
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onPressed: () {

            },
          )
        ],
      ),
      body: WalkthroughBody(),
      bottomNavigationBar: NavigateBottomBar(
        text: "Learn more",
        textStyle: TextStyle(
            fontSize: 20
        ),
        fontColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        onButtonPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()));
        },
      )
    );
  }
}