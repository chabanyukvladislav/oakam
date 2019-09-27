import 'package:flutter/material.dart';
import 'package:oakam/delegate.dart';
import 'package:oakam/iDelegate.dart';

import '../../managers/statisticManager.dart';
import '../../managers/iStatisticManager.dart';
import 'walkthroughSlideImageScreen.dart';
import 'walkthroughSlideVideoScreen.dart';

class WalkthroughBody extends StatefulWidget{
  final Delegate _lastScreenOpened = Delegate();
  final Delegate _lastScreenClosed = Delegate();

  @override
  State<WalkthroughBody> createState() => _WalkthroughBodyState();

  IDelegate lastScreenOpened() => _lastScreenOpened;
  IDelegate lastScreenClosed() => _lastScreenClosed;
}

class _WalkthroughBodyState extends State<WalkthroughBody> with SingleTickerProviderStateMixin {
  final IStatisticManager _manager = StatisticManager.getManager();
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
                      child: WalkthroughSlideImageScreen(
                          title: "NO LATE FEES",
                          text: "We don't charge late fees for missed\npayments or if you settle early",
                          imagePath: "assets/NoLateFees.svg",
                          screenIndex: 0
                      )
                  ),
                  Transform.translate(
                      offset: Offset(_screenWidth + _screenOffset, 0),
                      child: WalkthroughSlideVideoScreen(
                        title: "BUILD YOUR CREDIT",
                        text: "Making repayments may improve\nyour credit score",
                        imagePath: "assets/NoLateFees.svg",
                        screenIndex: 1,
                      )
                  ),
                  Transform.translate(
                      offset: Offset(_screenWidth * 2 + _screenOffset, 0),
                      child: WalkthroughSlideImageScreen(
                          title: "CASH WITHIN 10 MIN",
                          text: "Your loan could be approved in\nas little as 10 minutes",
                          imagePath: "assets/NoLateFees.svg",
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    if (_lastOffset != endValue)
      _logStatistics(endValue);
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

  void _logStatistics(double newOffset) {
    _manager.screenClosed();
    if (-newOffset < _screenWidth) {
      _manager.screenOpened("USP1");
      widget._lastScreenClosed.raise();
    }
    else if (-newOffset < _screenWidth * 2) {
      _manager.screenOpened("USP2");
      widget._lastScreenClosed.raise();
    }
    else if (-newOffset <= _screenWidth * 2) {
      _manager.screenOpened("USP3");
      widget._lastScreenOpened.raise();
    }
  }
}