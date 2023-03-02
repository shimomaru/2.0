import 'package:flutter/material.dart';
import 'package:nle_app/models/food.dart';

import '../main.dart';

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

// class TotalPrice with ChangeNotifier {
//   int ordersTotalPrice = 0;

//   int totalPrice() {
//     final ordersTotalPrice =
//         userOrders.fold(0, (sum, order) => sum + order.totalPrice);
//     notifyListeners();
//     return ordersTotalPrice;
//   }
// }
