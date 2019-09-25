import 'package:flutter/material.dart';

import '../navigateBottomBar.dart';
import '../page.dart';
import '../appBar.dart' as custom;
import 'aboutBody.dart';

class AboutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Page(
        appBar: custom.AppBar(
          isBackButton: true,
          backButtonColor: Colors.lightBlue,
          backButtonIcon: Icons.chevron_left,
          backButtonIconSize: 50,
          buttons: <MaterialButton>[
            FlatButton(
              color: Colors.transparent,
              textColor: Colors.lightBlue,
              child: Text(
                "Help",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onPressed: () {

              },
            )
          ],
        ),
        body: AboutBody(),
        bottomNavigationBar: NavigateBottomBar(
            text: "Let`s get started",
            fontColor: Colors.white,
            backgroundColor: Colors.lightBlue,
            textStyle: TextStyle(
                fontSize: 20
            ),
            onButtonPressed: () {

            }
        )
    );
  }
}