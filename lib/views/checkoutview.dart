import 'package:flutter/material.dart';
import 'package:nle_app/constants/colors.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/screens/detail/detail.dart';
import 'package:nle_app/screens/widgets/custom_app_bar.dart';
import 'package:nle_app/views/checkout.dart';
import 'package:nle_app/views/checkout2.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class CheckInfo extends StatefulWidget {
  const CheckInfo({super.key});

  @override
  State<CheckInfo> createState() => _CheckInfoState();
}

class _CheckInfoState extends State<CheckInfo> {
  void leftCall() {
    context.read<Counter>().update();
    Navigator.of(context).pop();
  }

  List thyList = userOrders;
  @override
  Widget build(BuildContext context) {
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
      ),
      backgroundColor: Color(0xff453658),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListScrollView(),
            NextButton(),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  final IconData leftIcon;
  final Function? leftCallback;
  //the left button on another page doesn't have a callback so it's nullable
  const BackButton(
    this.leftIcon, {
    this.leftCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null, //?
            child: _buildIcon(leftIcon),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8), //?
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon),
    );
  }
}
