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
}
