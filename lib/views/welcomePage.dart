import 'package:flutter/material.dart';

import '../managers/statisticManager.dart';
import '../managers/iStatisticManager.dart';
import '../myFlutterApp.dart';
import 'walkthrough/walkthroughPage.dart';

class WelcomePage extends StatefulWidget{
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final IStatisticManager _manager = StatisticManager.getManager();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(170, 230, 40, 1),
                      Color.fromRGBO(0, 210, 180, 1)
                    ],
                    stops: <double>[
                      0.1,
                      0.9
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight
                )
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "oakam",
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: "Futura"
                      )
                  ),
                  Container(
                      height: 60,
                      alignment: Alignment.topLeft,
                      child: Transform.rotate(
                          angle: 125,
                          child: Icon(
                              MyFlutterApp.logo_oval,
                              size: 30,
                              color: Colors.white
                          )
                      )
                  )
                ]
            )
        ),
        onTap: onTapped
    );
  }

  void onTapped() {
    _manager.screenOpened(WalkthroughPage.name);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalkthroughPage()));
  }
}