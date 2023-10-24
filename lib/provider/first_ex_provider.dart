import 'package:flutter/foundation.dart';

class FirstExampleProvider with ChangeNotifier {
  double _opacity =1;
  double get opacity => _opacity;

  void setValue(double vali){
    _opacity = vali;
    notifyListeners();
  }
}