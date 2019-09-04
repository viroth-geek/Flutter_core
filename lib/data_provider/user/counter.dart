import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  int _counter = 2;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }
}
