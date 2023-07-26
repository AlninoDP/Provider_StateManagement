import 'package:flutter/material.dart';

class CountModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); //* to notify a change of data
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
