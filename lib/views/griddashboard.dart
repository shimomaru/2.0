import 'package:flutter/material.dart';
import 'package:nle_app/models/food.dart';
import 'package:nle_app/models/stall.dart';
import 'package:nle_app/screens/home/stall_page.dart';

class GridDashboard extends StatelessWidget {
  final List<Stall> _stalls = [
    Stall(
      'Tray blazers',
      'Restaurant',
      'assets/images/tray_blazers--.png',
      'Open',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    ),
    Stall(
      'Papa rimz',
      'Stall',
      'assets/images/papa_rimz.png',
      'Open',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    ),
    Stall(
      'W Sauce',
      'Stall',
      'assets/images/w_sauce-removebg.png',
      'Open',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    ),
    Stall(
      'African Kitchen',
      'Stall',
      'assets/images/cherry-kitchen.png',
      'Open',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    ),
    Stall(
      'Suya Craze',
      'Stall',
      'assets/images/suya_craze.png',
      'Open',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    ),
    Stall(
      'Zulkys cafe',
      'Stall',
      'assets/images/zulkys-removeb.png',
      'Open',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    ),
    Stall(
      'Street food',
      'Stall',
      'assets/images/street_food--removebg-.png',
      'Open',
      4.5,
      {
        'Recommended': Food.generateRecommendedFoods1(),
        'Popular': Food.generatePopularFoods1(),
        'Smoothie': [],
        'Rice': [],
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: _stalls.map(
          (data) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xff453658),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StallPage(stall: data)));
                    },
                    child: Image.asset(
                      data.logoUrl,
                      width: 90, //double.infinity
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Colors.white38,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Text(
                  //   data.event,
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 11,
                  //     color: Colors.white70,
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

// class Item {
//   String title;
//   String subtitle;
//   String event;
//   String img;
//   String view;
//   Item({
//     required this.title,
//     required this.subtitle,
//     required this.event,
//     required this.img,
//     required this.view,
//   });
// }
