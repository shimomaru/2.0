import 'package:flutter/material.dart';
import 'package:nle_app/constants/colors.dart';
import 'package:nle_app/constants/routes.dart';
import 'package:nle_app/models/stall.dart';
import 'package:nle_app/screens/widgets/food_list.dart';
import 'package:nle_app/screens/widgets/food_list_view.dart';
import 'package:nle_app/screens/widgets/stall_info.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../widgets/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StallPage extends StatefulWidget {
  final Stall stall;

  const StallPage({super.key, required this.stall});

  @override
  State<StallPage> createState() => _StallPageState();
}

class _StallPageState extends State<StallPage> {
  var selected = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff392850), //kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            Icons.arrow_back_ios_outlined,
            Icons.search_outlined,
            leftCallback: () => Navigator.of(context).pop(),
            rightCallback: () => Navigator.of(context).pushNamed(searchRoute),
          ),
          StallInfo(
            stall: widget.stall,
          ), //
          FoodList(
            selected,
            (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
            widget.stall,
          ),
          Expanded(
            child: FoodListView(
              (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              widget.stall,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: widget.stall.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: const DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        elevation: 2,
        child: IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushNamed(cartRoute);
            context.read<TotalPrice>().update();
          },
        ),
      ),
    );
  }
}
