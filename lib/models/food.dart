import 'package:flutter/material.dart';
import 'package:nle_app/main.dart';

class Food {
  String imgUrl;
  String desc;
  String name;
  String waitTime;
  num score;
  int price;
  int pq;
  int quantity;
  bool favourited;
  List<Map<String, String>> ingredients;
  String about;
  bool highlight;
  Food(this.imgUrl, this.desc, this.name, this.pq, this.waitTime, this.score,
      this.price, this.quantity, this.ingredients, this.about, this.favourited,
      {this.highlight = false});

  int pqProduct(Food food) {
    pq = food.quantity * food.price;
    return pq;
  }

  static List<Food> generateRecommendedFoods1() {
    return [
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
          {
            'Flatbread': 'assets/images/flatbread-modified.png',
          },
          {'Cabbage': 'assets/images/cabbb-modified.png'},
          {'Chicken': 'assets/images/chicken-modified.png'},
          {'Sauce': 'assets/images/sauce-modified.png'},
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
  }

  static List<Food> generatePopularFoods1() {
    return [
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
  }
}

extension UserOrderTotalPrice on Food {
  int get totalPrice => price * quantity;
}
