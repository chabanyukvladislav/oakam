import '../Delegate.dart';
import '../iDelegate.dart';
import 'iUserManager.dart';

class UserManager implements IUserManager{
  final Delegate _userIdChanged = Delegate();
  static IUserManager _manager;
  String _userId = "temp";

  UserManager._internal();

  static IUserManager getManager() {
    if (_manager == null)
      _manager = UserManager._internal();

    return _manager;
  }

  @override
  String getUserId() => _userId;

  @override
  void logIn(){
    _setUserId("Temp1");
  }

  @override
  IDelegate getUserIdChangedEvent() => _userIdChanged;

  void _setUserId(String newId){
    _userId = "temp1";
    _userIdChanged.raise();
  }
}