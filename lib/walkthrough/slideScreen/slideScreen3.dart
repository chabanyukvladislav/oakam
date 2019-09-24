import 'package:flutter/material.dart';

import 'screensDots.dart';

class ThirdSlideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FadeInImage.assetNetwork(
                    image: "https://upload.wikimedia.org/wikipedia/commons/9/91/F-15_vertical_deploy.jpg",
                    placeholder: "assets/downloading.gif"
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Third screen",
                            style: TextStyle(
                                fontSize: 25
                            ),
                          ),
                          Container(height: 10),
                          Text(
                            "Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ],
                      )
                  )
              ),
              Container(
                  height: 20,
                  child: ScreenDots(
                    dotsCount: 3,
                    selectedIndex: 2,
                    selectedColor: Colors.lightBlue,
                    unselectedColor: Colors.grey,
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
              )
            ]
        )
    );
  }
}