import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'walkthrough/walkthroughPage.dart';

class OakamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _setSystemParams();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalkthroughPage(),
    );
  }

  void _setSystemParams(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}