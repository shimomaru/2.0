class OrderedItem extends Food {
  Variation selectVar;

  OrderedItem(
      this.selectVar,
      super.imgUrl,
      super.desc,
      super.name,
      super.pq,
      super.waitTime,
      super.score,
      super.price,
      super.quantity,
      super.variations,
      super.about,
      super.favourited,
      {super.highlight = false});
}

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
  List<Variation> variations;
  Variation? selectedVar;
  String about;
  bool highlight;
  Food(this.imgUrl, this.desc, this.name, this.pq, this.waitTime, this.score,
      this.price, this.quantity, this.variations, this.about, this.favourited,
      {this.highlight = false});

  int pqProduct(Food food) {
    pq = food.quantity * food.price;
    return pq;
  }

  List<Food> generateRecommendedFoods1() {
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
          Variation('assets/images/cabbb-modified.png', 'Chicken'),
          Variation('assets/images/chicken-modified.png', 'Beef'),
          Variation('assets/images/flatbread-modified.png', 'Mexican'),
          Variation('assets/images/sauce-modified.png', 'Suya'),
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

  List<Food> generatePopularFoods1() {
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

class Variation {
  String title;
  String imgURL;
  bool selected = false;
  Variation(this.imgURL, this.title);
}
