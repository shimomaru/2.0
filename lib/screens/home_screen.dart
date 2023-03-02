import 'package:flutter/material.dart';
import 'package:nle_app/constants/colors.dart';
import 'package:nle_app/constants/routes.dart';
import '../views/griddashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff392850),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 110),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    //<widget>
                    Text(
                      'Home',
                      style: TextStyle(
                        color: kBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Restaurant | Stalls',
                      style: TextStyle(
                        color: kBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: const Icon(
                      Icons.notifications_none_sharp,
                      color: Colors.greenAccent,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(notifRoute);
                    },
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(favRoute);
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          GridDashboard(),
        ],
      ),
    );
  }
}
