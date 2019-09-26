import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'iUserManager.dart';
import 'userManager.dart';
import 'iStatisticManager.dart';

class StatisticManager implements IStatisticManager {
  static const String _collectionName = "statistics";
  static const String _documentName = "screens";
  final IUserManager _userManager = UserManager.getManager();
  final Firestore _databaseReference = Firestore.instance;
  final Stopwatch _stopwatch = Stopwatch();
  final ListQueue<String> _screenStack = ListQueue<String>();
  static IStatisticManager _manager;
  String _screenName;
  String _userId;

  StatisticManager._internal();

  static IStatisticManager getManager() {
    if (_manager == null)
      _manager = StatisticManager._internal();

    return _manager;
  }

  @override
  void screenNavigationTo(String screenName) {
    _userManager.logIn();
    _screenStack.addLast(_screenName);
    screenClosed();
    screenOpened(screenName);
  }

  @override
  void screenNavigationBack() {
    screenClosed();
    String lastScreenName = _screenStack.last;
    screenOpened(lastScreenName);
  }

  @override
  void screenOpened(String screenName) {
    _userManager.getUserIdChangedEvent().subscribe(_onUserIdChanged);
    _userId = _userManager.getUserId();
    _screenName = screenName;
    _stopwatch.start();
  }

  @override
  void screenClosed() async {
    _userManager.getUserIdChangedEvent().unsubscribe(_onUserIdChanged);
    _stopwatch.stop();
    int minutes = _stopwatch.elapsed.inMinutes;
    int seconds = _stopwatch.elapsed.inSeconds;
    await _databaseReference.collection(_collectionName)
        .document(_documentName).collection(_userId)
        .document(DateTime.now().toString()).setData({
      "screenName": _screenName,
      "timestamp": "$minutes` $seconds``",
    });
    _stopwatch.reset();
  }

  void _onUserIdChanged() async {
    String userId = _userManager.getUserId();
    var documents = await _databaseReference.collection(_collectionName)
        .document(_documentName).collection(_userId).getDocuments();
    for(int i = 0; i < documents.documents.length; ++i) {
      DocumentSnapshot document = documents.documents[i];
      await _databaseReference.collection(_collectionName)
          .document(_documentName).collection(userId).document(
          document.documentID).setData(document.data);
    }
    _userId = userId;
  }
}