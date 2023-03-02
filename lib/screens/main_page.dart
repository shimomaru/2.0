import 'package:flutter/material.dart';
import 'taxi_page.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List pages = [
    const HomeScreen(),
    const TaxiPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff453658),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0, //?
        items: const [
          BottomNavigationBarItem(
              label: 'Buy', icon: Icon(Icons.fastfood_outlined)),
          BottomNavigationBarItem(label: 'Taxi', icon: Icon(Icons.local_taxi)),
        ],
      ),
      body: pages[currentIndex], //cool
    );
  }
}
