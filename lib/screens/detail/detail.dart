import 'package:flutter/material.dart';
import 'package:nle_app/constants/routes.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/models/food.dart';
import 'package:nle_app/screens/detail/widget/food_detail.dart';
import 'package:nle_app/screens/detail/widget/food_img.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  DetailPage(this.food);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    context.watch<Counter>();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 65,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined),
              color: Colors.black,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              width: 40,
              height: 40,
              child: IconButton(
                icon: Icon(
                  ((context.read<FavFood>().favorited(widget.food) == false)
                      ? Icons.favorite_outline
                      : Icons.favorite),
                  color: Colors.black,
                ),
                onPressed: () {
                  bool click2 = context.read<FavFood>().favorited(widget.food);
                  (context.read<FavFood>().rev(widget.food));
                  (context.read<FavFood>().favorited(widget.food));
                  setState(() {
                    click2 = !click2;
                  });
                  context.read<FavFood>().favorited(widget.food);
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff453658),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FoodImg(widget.food),
            FoodDetail(widget.food),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 56,
        child: RawMaterialButton(
          fillColor: const Color(0xff453658),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(cartRoute);
                  context.read<TotalPrice>().update();
                },
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  context.watch<Counter>().justdoit().toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
