import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/models/food.dart';
import 'package:nle_app/screens/detail/detail.dart';
import 'package:nle_app/screens/widgets/food_item.dart';

final priceTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

String getCurrency() {
  var format = NumberFormat.simpleCurrency(name: 'NGN');
  return format.currencySymbol;
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff453658),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: 80,
            child: Ink(
              decoration: const BoxDecoration(
                //?
                color: Color(0xff453658),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              kToolbarHeight,
              16.0,
              16.0,
            ),
            child: ListView(
              // padding: const EdgeInsets.all(20.0),
              children: [
                const Text(
                  'My Orders',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40.0),
                OrderListItem(
                  item: OrderItem(
                      title: userOrders[0].name,
                      quantity: 2,
                      price: 12,
                      bgColor: Colors.grey,
                      image: 'assets/images/jollof.jfif'),
                ),
                _buildDivider(),
                Container(
                  height: 2.0,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                _buildDivider(),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'TOTAL',
                      style: priceTextStyle.copyWith(color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      '${getCurrency()}4',
                      style: priceTextStyle.copyWith(color: Colors.black),
                    ),
                  ],
                ),
                _buildDivider(),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildDivider() => const SizedBox(height: 20.0);
}

class OrderItem {
  final String title;
  final int quantity;
  final double price;
  final String image;
  final Color bgColor;

  OrderItem({
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
    required this.bgColor,
  });
}

class OrderListItem extends StatefulWidget {
  final OrderItem item;

  const OrderListItem({super.key, required this.item});

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(name: 'NGN');
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    // var selected = 0;
    // final pageController = PageController();
    final userOrderss = userOrders;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: widget.item.bgColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              widget.item.image,
              fit: BoxFit.cover, //?
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              scrollDirection: Axis.vertical,
              itemCount: userOrders.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userOrderss[0].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 40.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            iconSize: 18.0,
                            padding: const EdgeInsets.all(2.0),
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          Text(
                            '${userOrders[0].quantity}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          IconButton(
                            iconSize: 18.0,
                            padding: const EdgeInsets.all(2.0),
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${getCurrency()}${widget.item.price * widget.item.quantity}',
            style: priceTextStyle,
          )
        ],
      ),
    );
  }
}
