import 'package:flutter/material.dart';

class CartCounter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;

    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class FinalPrice with ChangeNotifier {
  int _price = 0;

  int get price => _price;

  void increment() {
    _price += _price;
    notifyListeners();
  }

  void decrement() {
    _price--;

    notifyListeners();
  }

  void reset() {
    _price = 0;
    notifyListeners();
  }
}
