import 'package:flutter/material.dart';

import 'walkthroughAppBar.dart';
import 'walkthroughBody.dart';
import 'walkthroughBottomBar.dart';

class WalkthroughPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery
                .of(context)
                .size
                .width, 50),
          child: WalkthroughAppBar()
        ),
        body: WalkthroughBody(),
        bottomNavigationBar: WalkthroughBottomBar()
    );
  }
}