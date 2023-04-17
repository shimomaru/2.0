import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/screens/widgets/notifications.dart';
import 'package:nle_app/views/checkout.dart';
import 'package:provider/provider.dart';

class ListScrollView extends StatefulWidget {
  @override
  State<ListScrollView> createState() => _ListScrollViewState();
}

class _ListScrollViewState extends State<ListScrollView> {
  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 14,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return orderUp.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              itemCount: orderUp.length,
              itemBuilder: ((context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 130,
                            height: 130,
                            child: Image.asset(orderUp[index].imgUrl,
                                fit: BoxFit.fitHeight),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 60,
                            height: 60,
                            child: Image.asset(
                              selectedVars[index]!.imgURL,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Text(
                                      orderUp[index].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      context
                                          .read<FoodCount>()
                                          .reset(userOrders[index]);
                                      userOrders.remove(userOrders[index]);
                                      context.read<TotalPrice>().update();
                                      context.read<FavFood>().peeQee();
                                      context.read<Counter>().update();
                                      context.read<FavFood>().update();
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                              Text(
                                selectedVars[index]!.title,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic),
                              ),
                              _buildIconText(
                                Icons.access_time_outlined,
                                Colors.blue,
                                orderUp[index].waitTime,
                              ),
                              Row(
                                children: [
                                  Text(
                                    getCurrency(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${orderUp[index].price}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<FoodCount>()
                                            .decrement(userOrders[index]);
                                        context.read<FavFood>().peeQee();
                                        context.read<Counter>().update();
                                        context.read<FavFood>().update(); //
                                        if (context
                                                .read<FoodCount>()
                                                .display(userOrders[index]) ==
                                            0) {
                                          userOrders.remove(userOrders[index]);
                                        }
                                        setState(() {});
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff453658),
                                      ),
                                      child: Text(
                                        orderUp[index]
                                            .selectVar
                                            .amount
                                            .toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<FoodCount>()
                                            .increment(userOrders[index]);
                                        context.read<FavFood>().update();
                                        context.read<Counter>().update();
                                        context.read<FavFood>().peeQee();
                                        setState(() {});
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            ),
          )
        : Column(
            children: const [
              Text('No items in basket'),
            ],
          );
  }
}

class NextButton extends StatefulWidget {
  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(name: 'NGN');
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FavFood>();
    return orderUp.isNotEmpty
        ? Container(
            color: Colors.transparent,
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 5.0),
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              child: Text(
                '${getCurrency()}${context.read<FavFood>().peeQee()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                Notif.showBigTextNotification(
                    title: 'Order confirmation',
                    body: 'Order successful',
                    fln: flutterLocalNotificationsPlugin);
              },
            ),
          )
        : const Text('');
  }
}
