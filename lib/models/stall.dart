import 'food.dart';

class Stall {
  String name;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Stall(
    this.name,
    this.label,
    this.logoUrl,
    this.desc,
    this.score,
    this.menu,
  );
  static Stall generateRestaurant() {
    return Stall(
      'Tray blazers',
      'Restaurant',
      'assets/images/circle/tray_blazers.jpg',
      'Tray Blazers by Chef Tracy',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    );
  }
}
