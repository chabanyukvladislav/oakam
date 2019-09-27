import 'package:flutter/material.dart';
import 'package:oakam/myFlutterApp.dart';

import '../navigateBottomBar.dart';
import '../page.dart';
import '../appBar.dart' as custom;
import 'aboutBody.dart';

class AboutPage extends StatelessWidget {
  static const String name = "Discovery";

  @override
  Widget build(BuildContext context) {
    return Page(
        appBar: custom.AppBar(
          isBackButton: true,
          backButtonColor: MyFlutterApp.mainColor,
          backButtonIcon: Icons.chevron_left,
          backButtonIconSize: 40,
          buttons: <MaterialButton>[
            FlatButton(
              color: Colors.transparent,
              textColor: MyFlutterApp.mainColor,
              child: Text(
                "Help",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "SF Pro Display Semibold",
                  letterSpacing: 0.44
                ),
              ),
              onPressed: () {

              },
            )
          ],
        ),
        body: AboutBody(),
        bottomNavigationBar: NavigateBottomBar(
            text: "LET`S GET STARTED",
            fontColor: Colors.white,
            backgroundColor: MyFlutterApp.mainColor,
            textStyle: TextStyle(
                fontSize: 15,
                fontFamily: "SF Pro Display Semibold",
                letterSpacing: 0.3
            ),
            onButtonPressed: () {

            }
        )
    );
  }
}