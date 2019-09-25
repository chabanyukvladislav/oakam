import 'package:flutter/material.dart';

import '../../models/cardInfo.dart';

class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardInfoList = List<CardInfo>()
      ..add(CardInfo(icon: Icons.ac_unit, text: "Why our loans?"))..add(
          CardInfo(icon: Icons.account_balance, text: "Managing loans"))..add(
          CardInfo(icon: Icons.build, text: "Build your credit"))..add(
          CardInfo(icon: Icons.access_alarm, text: "Our rewards"));
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
              "About oakam",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
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
                    fontSize: 15
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
                    child: Card(
                        margin: EdgeInsets.fromLTRB(
                            index % 2 == 0 ? 0 : 10,
                            index < 2 ? 0 : 10,
                            index % 2 == 1 ? 0 : 10,
                            index > cardInfoList.length - 3 ? 0 : 10
                        ),
                        color: Colors.white70,
                        child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.all(15),
                                child: Icon(
                                  cardInfoList[index].icon,
                                  size: 50,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Expanded(child: Container()),
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.all(15),
                                  child: Text(
                                      cardInfoList[index].text,
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                              )
                            ]
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