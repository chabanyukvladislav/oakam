import 'package:flutter/material.dart';
import 'package:oakam/myFlutterApp.dart';

import '../../managers/statisticManager.dart';
import '../../managers/iStatisticManager.dart';
import '../about/aboutPage.dart';
import '../navigateBottomBar.dart';
import 'walkthroughBody.dart';
import '../page.dart';
import '../appBar.dart' as custom;

class WalkthroughPage extends StatefulWidget{
  static const String name = "USP1";

  @override
  State<WalkthroughPage> createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage>{
  final IStatisticManager _manager = StatisticManager.getManager();
  String _title = "Skip";
  WalkthroughBody _body;
  
  @override
  Widget build(BuildContext context) {
    _body = WalkthroughBody();
    _body.lastScreenOpened().subscribe(_setLastTitle);
    _body.lastScreenClosed().subscribe(_setDefaultTitle);
    return Page(
        appBar: custom.AppBar(
          buttons: <MaterialButton>[
            FlatButton(
              color: Colors.transparent,
              textColor: MyFlutterApp.mainColor,
              child: Text(
                _title,
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0.44,
                  fontFamily: "SF Pro Display Semibold"
                ),
              ),
              onPressed: () {

              },
            )
          ],
        ),
        body: _body,
        bottomNavigationBar: NavigateBottomBar(
          text: "LEARN MORE",
          textStyle: TextStyle(
              fontSize: 15,
              fontFamily: "SF Pro Display Semibold",
              letterSpacing: 0.5
          ),
          fontColor: Colors.white,
          backgroundColor: MyFlutterApp.mainColor,
          onButtonPressed: () => _navigateTo(context, AboutPage()),
        )
    );
  }
  
  void _navigateTo(BuildContext context, Widget screen) async {
    _body.lastScreenOpened().unsubscribe(_setLastTitle);
    _body.lastScreenClosed().unsubscribe(_setDefaultTitle);
    _manager.screenNavigationTo(AboutPage.name);
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutPage()));
    _manager.screenNavigationBack();
  }

  void _setLastTitle(){
    setState(() {
      _title = "Done";
    });
  }

  void _setDefaultTitle(){
    setState(() {
      _title = "Skip";
    });
  }
}