import 'iDelegate.dart';

class Delegate implements IDelegate {
  final List<Function> _methods = List<Function>();

  @override
  void subscribe(Function method) {
    if (!_methods.contains(method))
      _methods.add(method);
  }

  @override
  void unsubscribe(Function method) {
    if (_methods.contains(method))
      _methods.remove(method);
  }

  void raise() {
    for (int i = 0; i < _methods.length; ++i) {
      _methods[i]();
    }
  }
}