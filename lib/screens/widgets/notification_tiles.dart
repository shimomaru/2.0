import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationTile1 extends StatefulWidget {
  const NotificationTile1({super.key});

  @override
  State<NotificationTile1> createState() => _NotificationTile1State();
}

class _NotificationTile1State extends State<NotificationTile1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TileImg('assets/images/ico-modified-rem.png'),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Order Confirmation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Order Successful',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'You ordered Shawarma',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}

class TileImg extends StatelessWidget {
  String? imageLink;
  TileImg(this.imageLink);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Column(
            children: [
              // Expanded(
              //   flex: 1,
              //   child: Container(),
              // ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Color(0xFFF5F5F5),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(-1, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.asset(
                imageLink.toString(),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
