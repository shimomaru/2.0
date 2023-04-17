import 'package:flutter/material.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/screens/widgets/notification_tiles.dart';
import 'package:nle_app/screens/widgets/picture_tile.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List thyList = orderUp;
  List newNotification = ['liked', 'follow'];
  List todayNotification = ['follow', 'liked', 'liked'];
  List oldestNotification = ['follow'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff453658),
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(17, 0, 20, 20),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade300,
                  ),
                ),
              ),
              Text(
                'New',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade100,
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newNotification.length,
                itemBuilder: (context, index) {
                  return newNotification[index] == 'follow'
                      ? PictureTile()
                      : NotificationTile1();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade100,
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: todayNotification.length,
                itemBuilder: (context, index) {
                  return todayNotification[index] == 'follow'
                      ? PictureTile()
                      : NotificationTile1();
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Oldest',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade100,
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: oldestNotification.length,
                itemBuilder: (context, index) {
                  return oldestNotification[index] == 'follow'
                      ? PictureTile()
                      : NotificationTile1();
                },
              ),
            ],
          ),
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
