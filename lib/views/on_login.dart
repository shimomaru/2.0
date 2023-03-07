import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nle_app/screens/widgets/animated_button.dart';
import 'package:nle_app/screens/widgets/sign_in_form.dart';
import 'package:rive/rive.dart';

class OnloginScreen extends StatefulWidget {
  const OnloginScreen({super.key});

  @override
  State<OnloginScreen> createState() => _OnloginScreenState();
}

class _OnloginScreenState extends State<OnloginScreen> {
  late RiveAnimationController _buttonAnimationController;
  bool showSignInDialog = false;

  @override
  void initState() {
    _buttonAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // height: 100,
            width: MediaQuery.of(context).size.width, //
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: showSignInDialog ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            'Make easy things easier',
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Poppins',
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Buy food without waiting in line and confirm your drivers from anywhere',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AnimatedButton(
                      buttonAnimationController: _buttonAnimationController,
                      press: () {
                        _buttonAnimationController.isActive = true;
                        Future.delayed(
                          Duration(milliseconds: 800),
                          () {
                            setState(() {
                              showSignInDialog = true;
                            });
                            signInDialog(context);
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text('Strictly for students and staff of NUN'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Object?> signInDialog(BuildContext context) {
    void close() {
      Navigator.pop(context);
    }

    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Sign in',
      context: context,
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 620,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                    onTap: () {
                      close();
                      setState(() {
                        showSignInDialog = false;
                      });
                    },
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]),
                Column(
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Text(
                        'Sign in with your assigned school email and get started',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SignInForm(),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'Get help',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          tooltip: 'Reset password',
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/microsoft.svg',
                            height: 64,
                            width: 64,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          tooltip: 'Ask for support',
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/email_box.svg',
                            height: 64,
                            width: 64,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
