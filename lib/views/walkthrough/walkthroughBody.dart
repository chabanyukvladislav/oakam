import 'package:flutter/material.dart';

import 'walkthroughSlideScreen.dart';
import 'walkthroughSlideVideoScreen.dart';

class WalkthroughBody extends StatefulWidget{
  @override
  State<WalkthroughBody> createState() => _WalkthroughBodyState();
}

class _WalkthroughBodyState extends State<WalkthroughBody> with SingleTickerProviderStateMixin {
  double _lastOffset;
  double _screenWidth;
  double _screenOffset;
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _lastOffset = 0;
    _screenOffset = 0;
    _controller = AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
        child: Container(
            color: Colors.transparent,
            child: Stack(
                children: <Widget>[
                  Transform.translate(
                      offset: Offset(_screenOffset, 0),
                      child: WalkthroughSlideScreen(
                          title: "First screen",
                          text: "asg dfh a First screen First screen First screen First screen First screen First screen screen sdg safg afdjs",
                          image: NetworkImage(
                              "https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LGMeL91dCOQltZDcGky%2F-LSNIoWLCviCKdOdQInG%2F-LSNJbond2eu6KoNFUvk%2Fcat.png?alt=media&token=c563c908-c678-479e-8e12-c44c3a182c95"
                          ),
                          screenIndex: 0
                      )
                  ),
                  Transform.translate(
                      offset: Offset(_screenWidth + _screenOffset, 0),
                      child: WalkthroughSlideVideoScreen(
                        title: "Second screen",
                        text: "Second screen Second screen Second screen Second screen Second screen Second screen sdg safg afdjs",
                        image: NetworkImage(
                            "https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LGMeL91dCOQltZDcGky%2F-LSNIoWLCviCKdOdQInG%2F-LSNJbond2eu6KoNFUvk%2Fcat.png?alt=media&token=c563c908-c678-479e-8e12-c44c3a182c95"
                        ),
                        screenIndex: 1,
                      )
                  ),
                  Transform.translate(
                      offset: Offset(_screenWidth * 2 + _screenOffset, 0),
                      child: WalkthroughSlideScreen(
                          title: "Third screen",
                          text: "sd ghhggffd Third screen Third screen Third screen Third screen Third screen Third screen screen sdg safg afdjs",
                          image: NetworkImage(
                              "https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LGMeL91dCOQltZDcGky%2F-LSNIoWLCviCKdOdQInG%2F-LSNJbond2eu6KoNFUvk%2Fcat.png?alt=media&token=c563c908-c678-479e-8e12-c44c3a182c95"
                          ),
                          screenIndex: 2
                      )
                  )
                ]
            )
        ),
        onHorizontalDragStart: _onHorizontalDragStarted,
        onHorizontalDragUpdate: _onHorizontalDragUpdated,
        onHorizontalDragEnd: _onHorizontalDragEnded
    );
  }

  void _onHorizontalDragStarted(DragStartDetails details) {
    if (_controller.status == AnimationStatus.dismissed)
      _lastOffset = _screenOffset;
  }

  void _onHorizontalDragUpdated(DragUpdateDetails details) {
    double newScreenOffset = _screenOffset + details.delta.dx;
    if (newScreenOffset > 0)
      newScreenOffset = 0;
    else if (newScreenOffset < -_screenWidth * 2)
      newScreenOffset = -_screenWidth * 2;

    setState(() {
      _screenOffset = newScreenOffset;
    });
  }

  void _onHorizontalDragEnded(DragEndDetails details) {
    if (_controller.status != AnimationStatus.dismissed)
      return;

    double defaultDelta = _screenWidth / 5;
    double delta = _lastOffset - _screenOffset;
    double endValue;
    if (delta > defaultDelta)
      endValue = _lastOffset - _screenWidth;
    else if (delta < -defaultDelta)
      endValue = _lastOffset + _screenWidth;
    else
      endValue = _lastOffset;

    _animation = Tween<double>(
        begin: _screenOffset,
        end: endValue
    ).animate(_controller)
      ..addListener(_slideAnimationListener)
      ..addStatusListener(_slideAnimationStatusListener);
    _controller.forward();
  }

  void _slideAnimationListener() {
    setState(() {
      _screenOffset = _animation.value;
    });
  }

  void _slideAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animation.removeListener(_slideAnimationListener);
      _animation.removeStatusListener(_slideAnimationStatusListener);
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}