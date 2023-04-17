import 'package:flutter/material.dart';
import 'package:nle_app/constants/colors.dart';
import 'package:nle_app/models/food.dart';
import 'package:nle_app/screens/detail/widget/food_quantity.dart';

class FoodDetail extends StatefulWidget {
  final Food food;

  FoodDetail(this.food, {super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool selected = false;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.food.selectedVar = widget.food.variations[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      color: kBackground,
      child: Column(
        children: [
          Text(
            widget.food.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconText(
                Icons.access_time_outlined,
                Colors.blue,
                widget.food.waitTime,
              ),
              _buildIconText(
                Icons.star_outlined,
                Colors.amber,
                widget.food.score.toString(),
              ),
            ],
          ),
          const SizedBox(height: 30),
          FoodQuantity(widget.food),
          const SizedBox(height: 30),
          Row(
            children: const [
              Text(
                'Variations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: widget.food.variations.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.food.variations[index].selected) {
                      selectedIndex = index;
                    } else {
                      selectedIndex = index;
                    }
                    if (selectedIndex == index) {
                      widget.food.selectedVar = widget.food.variations[index];
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == index ? kPrimaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          widget.food.variations[index].imgURL.toString(),
                          width: 52,
                        ),
                        Text(
                          widget.food.variations[index].title,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: const [
              Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.food.about,
            style: const TextStyle(
              wordSpacing: 1.2,
              height: 1.5,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
