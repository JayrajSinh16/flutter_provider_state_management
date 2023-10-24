import 'package:flutter/foundation.dart';

class SecondExampleProvider with ChangeNotifier{

  List<int> list = [];

  List<int> get selected => list;

  void addItem(int value){
    list.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    list.remove(value);
    notifyListeners();
  }
}