import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nle_app/main.dart';

class PictureTile extends StatelessWidget {
  const PictureTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: Stack(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      AssetImage('assets/images/ico-modified-rem.png'),
                ),
              ),
              Positioned(
                bottom: 10,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/sha-modified.png'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
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
                'Order Cancelled',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'You ordered Shawarma',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/images/chicken-shawarma-modified.png',
          height: 95,
          width: 91,
        ),
      ],
    );
  }
}
