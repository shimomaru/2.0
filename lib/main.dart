import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nle_app/exceptions/exceptions.dart';
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
        ChangeNotifierProvider(create: (_) => VarAmount()),
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
List<Variation?> selectedVars = [];
Map<Food, Variation> usedVars = {};
List<OrderedItem> orderUp = [];
List<int> bruhhh = [];

class VarAmount with ChangeNotifier {
  void increment(Variation? variation) {
    variation!.amount++;
    notifyListeners();
  }

  void decrement(Variation variation) {
    variation.amount--;
    notifyListeners();
  }

  int display(Variation variation) {
    int quantity;
    quantity = variation.amount;
    return quantity;
  }

  void update() {
    notifyListeners();
  }
}

class Counter with ChangeNotifier {
  int justdoit() {
    for (var i = 0; i < orderUp.length; i++) {
      bruhhh.add(orderUp[i].selectVar.amount);
    }

    int count =
        bruhhh.fold(0, (previousValue, element) => previousValue + element);
    return count;
  }

  int _count =
      bruhhh.fold(0, (previousValue, element) => previousValue + element);
  int get count => _count;

  void reset() {
    _count = 0;
    notifyListeners();
  }

  int update() {
    _count = orderUp.fold(
        0, (previousValue, element) => previousValue + element.quantity);
    return _count;
  }
}

class TotalPrice with ChangeNotifier {
  int _ordersTotalPrice = orderUp.fold(0, (a, element) => a + element.price);

  int get ordersTotalPrice => _ordersTotalPrice;

  int totalPrice() {
    _ordersTotalPrice = orderUp.fold(0, (a, element) => a + element.price);
    notifyListeners();
    return _ordersTotalPrice;
  }

  void update() {
    _ordersTotalPrice = orderUp.fold(0, (a, element) => a + element.price);
    notifyListeners();
  }
}

class FavFood with ChangeNotifier {
  bool favorited(Food food) {
    bool fud = food.favourited;
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
    int pQ = orderUp.fold(
        0, (a, element) => a + (element.selectVar.amount * element.price));
    return pQ;
  }

  void update() {
    notifyListeners();
  }
}

// int loop(List list) {
//   for (var i = 0; i < list.length; i++) {
//     int currentValue = i;
//     list[currentValue];
//   }
//   return 0;
// }

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

List<Food> allFood = [
  Food(
    'assets/images/sha-modified.png',
    'Most Recommended',
    'Shawarma',
    0,
    '15 min',
    4.5,
    1500,
    0,
    [
      Variation('assets/images/cabbb-modified.png', 'Chicken', 0),
      Variation('assets/images/chicken-modified.png', 'Beef', 0),
      Variation('assets/images/flatbread-modified.png', 'Mexican', 0),
      Variation('assets/images/sauce-modified.png', 'Suya', 0),
    ],
    'A sandwich of sliced lamb or chicken, vegetables, and often tahini wrapped in pita bread',
    highlight: true,
    false,
  ),
  Food(
    'assets/images/smoothie-.png',
    'Most Recommended',
    'Smoothie',
    0,
    '7 min',
    4.5,
    1500,
    0,
    [
      // {
      //   'Flatbread': 'assets/images/flatbread-modified.png',
      // },
      // {'Cabbage': 'assets/images/cabbb-modified.png'},
      // {'Chicken': 'assets/images/chicken-modified.png'},
      // {'Sauce': 'assets/images/sauce-modified.png'},
    ],
    'A sandwich of sliced lamb or chicken, vegetables, and often tahini wrapped in pita bread',
    highlight: true,
    false,
  ),
];

List<Food> popularFood = [
  Food(
    'assets/images/smoothie-.png',
    'Highly Recommended',
    'Smoothie',
    0,
    '10 min',
    4.4,
    1500,
    0,
    [
      // {
      //   'Flatbread': 'assets/images/flatbread-modified.png',
      // },
      // {'Cabbage': 'assets/images/cabbb-modified.png'},
      // {'Chicken': 'assets/images/chicken-modified.png'},
      // {'Sauce': 'assets/images/sauce-modified.png'},
    ],
    'A beverage made by puréeing ingredients in a blender',
    false,
  ),
];
