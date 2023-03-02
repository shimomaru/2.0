import 'package:flutter/material.dart';

class NeumorphicMenuIcon extends StatefulWidget {
  const NeumorphicMenuIcon({super.key});

  @override
  State<NeumorphicMenuIcon> createState() => _NeumorphicMenuIconState();
}

class _NeumorphicMenuIconState extends State<NeumorphicMenuIcon>
    with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedRotation(
        curve: Curves.easeOutExpo,
        turns: turns,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
          onTap: () {
            if (isClicked) {
              setState(
                () => turns -= 1 / 4,
              );
              _controller.reverse();
            } else {
              setState(
                () => turns += 1 / 4,
              );
              _controller.forward();
            }
            isClicked = !isClicked;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color(0xff453658),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 30.0,
                  offset: const Offset(20, 20),
                  color: Colors.grey,
                ),
                BoxShadow(
                  blurRadius: 30.0,
                  offset: const Offset(-20, -20),
                  color: Colors.white,
                ),
              ],
            ),
            child: SizedBox(
              height: 150,
              width: 150,
              child: Center(
                child: AnimatedIcon(
                  icon: AnimatedIcons.event_add,
                  progress: _controller,
                  size: 50,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
