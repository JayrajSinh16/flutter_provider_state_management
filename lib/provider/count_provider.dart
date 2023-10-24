import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _cnt = 50;
  int get cnt => _cnt;

  void setCount() {
    _cnt++;
    notifyListeners();
  }
}