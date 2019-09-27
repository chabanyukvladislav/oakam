import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oakam/myFlutterApp.dart';

import '../../models/cardInfo.dart';

class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardInfoList = List<CardInfo>()
      ..add(CardInfo(
          icon: "assets/ManagingLoans_Icon.svg", text: "WHY OUR\nLOANS?"))..add(
          CardInfo(icon: "assets/ManagingLoans_Icon.svg",
              text: "MANAGING\nLOANS"))..add(
          CardInfo(icon: "assets/ManagingLoans_Icon.svg",
              text: "BUILD YOUR\nCREDIT"))..add(
          CardInfo(
              icon: "assets/ManagingLoans_Icon.svg", text: "OUR\nREWARDS"));
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
              "ABOUT OAKAM",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Proxima Nova Soft Bold",
                  letterSpacing: 0.4,
                  color: MyFlutterApp.titleColor
              )
          ),
        ),
        Container(
            height: 5
        ),
        Container(
            alignment: Alignment.topLeft,
            child: Text(
                "Better money, brighter future.",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "SF Pro Display Regular",
                    color: MyFlutterApp.textColor,
                    letterSpacing: 0.3
                )
            )
        ),
        Container(
            height: 15
        ),
        Expanded(
            child: GridView.builder(
              itemCount: cardInfoList.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(
                            index % 2 == 0 ? 0 : 10,
                            index < 2 ? 0 : 10,
                            index % 2 == 1 ? 0 : 10,
                            index > cardInfoList.length - 3 ? 0 : 10
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: MyFlutterApp.cardBorderColor
                            )
                        ),
                        child: Card(
                            elevation: 0,
                            color: MyFlutterApp.cardColor,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.all(15),
                                    child: SvgPicture.asset(
                                      cardInfoList[index].icon,
                                      color: MyFlutterApp.mainColor,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: EdgeInsets.all(15),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                              cardInfoList[index].text,
                                              style: TextStyle(
                                                  color: MyFlutterApp.textColor,
                                                  fontSize: 16,
                                                  letterSpacing: 0.38,
                                                  fontFamily: "Proxima Nova Soft Bold"
                                              )
                                          ),
                                          Expanded(
                                              child: SvgPicture.asset(
                                                "assets/cardNext.svg",
                                                color: MyFlutterApp.mainColor,
                                                alignment: Alignment.center,
                                                width: 17,
                                                height: 17,
                                              )
                                          )
                                        ],
                                      )
                                  )
                                ]
                            )
                        )
                    )
                );
              },
            )
        )
      ],
    );
  }
}