import 'package:flutter/material.dart';
import 'package:nle_app/models/stall.dart';
import 'package:nle_app/screens/detail/detail.dart';
import 'package:nle_app/screens/widgets/food_item.dart';

class FoodListView extends StatelessWidget {
  final Function callback;
  final PageController pageController;
  final Stall stall;

  const FoodListView(
    this.callback,
    this.pageController,
    this.stall,
  );

  @override
  Widget build(BuildContext context) {
    final menuList = stall.menu.values.toList();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (index) => callback(index),
          itemCount: menuList.length,
          itemBuilder: (context, menuIndex) {
            final menu = menuList[menuIndex];
            return ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          menu[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FoodItem(menu[index]),
                  )),
              separatorBuilder: (_, index) => const SizedBox(height: 15),
              itemCount: menu.length,
            );
          },
        ));
  }
}
