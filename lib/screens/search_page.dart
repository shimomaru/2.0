import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nle_app/models/food.dart';
import 'package:nle_app/screens/detail/detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(name: 'NGN');
    return format.currencySymbol;
  }

  static List<Food> searchFoodList = [
    Food(
      'assets/images/sha-modified.png',
      'Most Recommended',
      'Shawarma',
      0,
      '15 min',
      4.5,
      1500,
      0,
      [
        Variation('assets/images/chicken-modified.png', 'Chicken'),
        Variation('assets/images/cabbb-modified.png', 'Beef'),
        Variation('assets/images/flatbread-modified.png', 'Mexican'),
        Variation('assets/images/sauce-modified.png', 'Suya'),
      ],
      'A sandwich of sliced lamb or chicken, vegetables, and often tahini wrapped in pita bread',
      true,
      highlight: true,
    ),
    Food(
      'assets/images/smoothie-.png',
      'Most Recommended',
      'Smoothie',
      0,
      '7 min',
      4.5,
      1500,
      0,
      [
        // {
        //   'Flatbread': 'assets/images/flatbread-modified.png',
        // },
        // {'Cabbage': 'assets/images/cabbb-modified.png'},
        // {'Chicken': 'assets/images/chicken-modified.png'},
        // {'Sauce': 'assets/images/sauce-modified.png'},
      ],
      'A sandwich of sliced lamb or chicken, vegetables, and often tahini wrapped in pita bread',
      true,
      highlight: true,
    ),
  ];

  List<Food> searchFood = List.from(searchFoodList);

  void updateList(String value) {
    setState(() {
      searchFood = searchFoodList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff453658),
        elevation: 0,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xff453658),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search for item',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff302360),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'eg: Beef Burger',
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.purple.shade900),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: searchFood.isEmpty
                  ? const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchFood.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          searchFood[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          getCurrency() + searchFood[index].price.toString(),
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        trailing: Text(
                          searchFood[index].waitTime,
                          style: const TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                        leading: Image.asset(searchFood[index].imgUrl),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              searchFood[index],
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
