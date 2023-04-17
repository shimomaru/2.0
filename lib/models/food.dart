class OrderedItem {
  Variation selectVar;
  String imgUrl;
  String name;
  int pq;
  String waitTime;
  int price;
  int quantity;

  OrderedItem(
    this.selectVar,
    this.imgUrl,
    this.name,
    this.pq,
    this.waitTime,
    this.price,
    this.quantity,
  );
  int pqProduct(OrderedItem orderedItem) {
    pq = orderedItem.quantity * orderedItem.price;
    return pq;
  }
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
  Variation selectedVar =
      Variation('assets/images/cabbb-modified.png', 'Chicken', 0);
  String about;
  bool highlight;
  Food(this.imgUrl, this.desc, this.name, this.pq, this.waitTime, this.score,
      this.price, this.quantity, this.variations, this.about, this.favourited,
      {this.highlight = false});

  int pqProduct(Food food) {
    pq = food.quantity * food.price;
    return pq;
  }
}

class Variation {
  String title;
  String imgURL;
  int amount;
  bool selected = false;
  Variation(this.imgURL, this.title, this.amount);

  // int pqProduct(Food food) {
  //   pq = food.quantity * food.price;
  //   return pq;
  // }
}
