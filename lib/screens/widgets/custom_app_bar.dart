import 'package:flutter/material.dart';
import 'package:nle_app/main.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final Function? leftCallback;
  final Function? rightCallback;
  //the left button on another page doesn't have a callback so it's nullable
  const CustomAppBar(
    this.leftIcon,
    this.rightIcon, {
    this.leftCallback,
    this.rightCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null, //?
            child: _buildIcon(leftIcon),
          ),
          GestureDetector(
            onTap: rightCallback != null ? () => rightCallback!() : null,
            child: _buildIcon(rightIcon),
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

class CustomAppBar2 extends StatefulWidget {
  @override
  State<CustomAppBar2> createState() => _CustomAppBar2State();
}

bool click = false;

bool clickState() {
  bool clickState = click;
  return clickState;
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            width: 40,
            height: 40,
            child: IconButton(
              icon: Icon(
                  (click == false) ? Icons.favorite_outline : Icons.favorite),
              onPressed: () {
                setState(() {
                  click = !click;
                  // context.read<FavFood>().favorited(f);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
