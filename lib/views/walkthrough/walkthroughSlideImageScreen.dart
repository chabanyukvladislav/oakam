import 'package:flutter_svg/flutter_svg.dart';

import 'walkthroughSlideScreen.dart';

class WalkthroughSlideImageScreen extends WalkthroughSlideScreen {
  final String imagePath;
  final String title;
  final String text;
  final int screenIndex;

  WalkthroughSlideImageScreen({this.imagePath, this.title, this.text, this.screenIndex})
      : super(
    title: title,
    text: text,
    screenIndex: screenIndex,
    image: SvgPicture.asset(imagePath),
  );
}