import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nle_app/models/food.dart';
import 'package:nle_app/models/stall.dart';
import 'package:nle_app/screens/main_page.dart';
import 'package:nle_app/screens/search_page.dart';
import 'package:nle_app/views/checkoutview.dart';
import 'package:nle_app/views/fav_page.dart';
import 'package:nle_app/views/notification_page.dart';
import 'package:provider/provider.dart';
import 'constants/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => TotalPrice()),
        ChangeNotifierProvider(create: (_) => FoodCount()),
        ChangeNotifierProvider(create: (_) => FavFood()),
      ],
      child: MyApp(),
    ),
  );
}

bool openStall(Stall stall) {
  if (stall.desc == 'Open') {
    return true;
  } else {
    return false;
  }
}

List<Food> userOrders = [];
List<Food> favFood = [];
List<int> notifications = [];
List<Variation> selectedVars = [];

class Counter with ChangeNotifier {
  // int _count = userOrders.length;

  int _count = userOrders.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  int get count => _count;

  void reset() {
    _count = 0;
    notifyListeners();
  }

  int update() {
    _count = userOrders.fold(
        0, (previousValue, element) => previousValue + element.quantity);
    notifyListeners();
    return _count;
  }
}

class TotalPrice with ChangeNotifier {
  int _ordersTotalPrice = userOrders.fold(0, (a, element) => a + element.price);

  int get ordersTotalPrice => _ordersTotalPrice;

  int totalPrice() {
    _ordersTotalPrice = userOrders.fold(0, (a, element) => a + element.price);
    notifyListeners();
    return _ordersTotalPrice;
  }

  void update() {
    _ordersTotalPrice = userOrders.fold(0, (a, element) => a + element.price);
    notifyListeners();
  }
}

class FavFood with ChangeNotifier {
  bool favorited(Food food) {
    // food.favourited = !food.favourited;
    if (food.favourited == true) {
      if (favFood.contains(food)) {
        return food.favourited;
      } else {
        favFood.add(food);
      }
    } else if (food.favourited == false) {
      if (favFood.contains(food) == false) {
        return food.favourited;
      } else {
        favFood.remove(food);
      }
    } else {}
    bool fud = food.favourited;
    // notifyListeners();
    return fud;
  }

  bool rev(Food food) {
    food.favourited = !food.favourited;
    notifyListeners();
    return food.favourited;
  }

  void addFood(Food food) {
    favFood.add(food);
    notifyListeners();
  }

  void removeFood(Food food) {
    favFood.remove(food);
    notifyListeners();
  }

  int peeQee() {
    int pqe =
        userOrders.fold(0, (a, element) => a + element.pqProduct(element));
    return pqe;
  }

  void update() {
    notifyListeners();
  }
}

class FoodCount with ChangeNotifier {
  void increment(Food food) {
    food.quantity++;
    notifyListeners();
  }

  void decrement(Food food) {
    food.quantity--;
    notifyListeners();
  }

  int display(Food food) {
    int count = food.quantity;
    return count;
  }

  void reset(Food food) {
    food.quantity = 0;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      home: MainPage(),
      routes: {
        cartRoute: (context) => CheckInfo(),
        searchRoute: (context) => SearchPage(),
        favRoute: (context) => FavPage(),
        notifRoute: (context) => NotificationsPage(),
      },
    );
  }
}
