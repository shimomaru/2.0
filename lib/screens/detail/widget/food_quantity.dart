import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nle_app/constants/colors.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/models/food.dart';
import 'package:nle_app/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class FoodQuantity extends StatefulWidget {
  final Food food;
  FoodQuantity(this.food);

  @override
  State<FoodQuantity> createState() => _FoodQuantityState();
}

class _FoodQuantityState extends State<FoodQuantity> {
  final int amount = 0;

  String getCurrency() {
    var format = NumberFormat.simpleCurrency(name: 'NGN');
    return format.currencySymbol;
  }

  Future<int> counter() async {
    final int result = await Future.delayed(const Duration(seconds: 5), () {
      int result = context.read<FoodCount>().display(widget.food);
      return result;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(-1, 0), //0.3
            child: Container(
              width: 120,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15), //Spacing
                  Text(
                    getCurrency(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.food.price.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 0), //0.3
            child: Container(
              height: double.maxFinite,
              width: 120,
              decoration: BoxDecoration(
                color: Color(0xff453658),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (context.read<Counter>().count != 0) {
                        // context.read<Counter>().decrement();
                        // widget.food.quantity--;
                        // userOrders.remove(widget.food);
                        context.read<FoodCount>().decrement(widget.food);
                        // context.read<Prices>().pricered(widget.food);
                        // int valueP = widget.food.quantity * widget.food.price;
                        // orderPrices.add(valueP);

                        setState(() {});
                      } else {
                        // context.read()<Counter>();
                      }
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Text(
                      // counter().toString(),
                      context
                          .watch<FoodCount>()
                          .display(widget.food)
                          .toString(),
                      // widget.food.quantity.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // widget.food.quantity++;
                      if (userOrders.contains(widget.food)) {
                        // context.read<Counter>().increment();
                        context.read<FoodCount>().increment(widget.food);
                        context.read<Counter>().update();
                      } else {
                        userOrders.add(widget.food); ////
                        context.read<Counter>().update();
                        setState(() {});
                      }
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
