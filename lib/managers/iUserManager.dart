import '../iDelegate.dart';

abstract class IUserManager{
  IDelegate getUserIdChangedEvent();
  String getUserId();
  void logIn();
}