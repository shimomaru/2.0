import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/models/food.dart';
import 'package:provider/provider.dart';

class FoodQuantity extends StatefulWidget {
  final Food food;
  FoodQuantity(this.food);

  @override
  State<FoodQuantity> createState() => _FoodQuantityState();
}

class _FoodQuantityState extends State<FoodQuantity> {
  final int amount = 0;
  bool showSignInDialog = false;

  String getCurrency() {
    var format = NumberFormat.simpleCurrency(name: 'NGN');
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                color: const Color(0xff453658),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (context.read<Counter>().count != 0) {
                        context.read<FoodCount>().decrement(widget.food);
                        setState(() {});
                      } else {
                        errorDialog(
                          context,
                          'ERROR',
                          "You can't buy -1 ${widget.food.name}s",
                        );
                      }
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white38),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Text(
                      context
                          .watch<VarAmount>()
                          .display(widget.food.selectedVar)
                          .toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      OrderedItem newOrder = OrderedItem(
                        widget.food.selectedVar,
                        widget.food.imgUrl,
                        widget.food.name,
                        widget.food.pq,
                        widget.food.waitTime,
                        widget.food.price,
                        widget.food.quantity,
                      );
                      if (selectedVars.contains(widget.food.selectedVar)) {
                        if (orderUp.contains(newOrder)) {
                          context
                              .read<VarAmount>()
                              .increment(widget.food.selectedVar);
                        } else {
                          // orderUp.add(newOrder);
                          context
                              .read<VarAmount>()
                              .increment(widget.food.selectedVar);
                        }
                      } else {
                        selectedVars.add(widget.food.selectedVar);
                        orderUp.add(newOrder);
                        context
                            .read<VarAmount>()
                            .increment(widget.food.selectedVar);
                      }
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white38,
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

  Future<Object?> errorDialog(
      BuildContext context, String title, String details) {
    void close() {
      Navigator.pop(context);
    }

    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Error',
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 170,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        close();
                        setState(() {
                          showSignInDialog = false;
                        });
                      },
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title.toString(),
                          style: const TextStyle(
                            fontSize: 34,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Text(
                            details.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
