import 'package:flutter/material.dart';
import 'package:nle_app/constants/colors.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/views/checkout.dart';
import 'package:provider/provider.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List thyList = orderUp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xff453658),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Favourites',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade300,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FavScrollView(),
          ],
        ),
      ),
    );
  }
}

class FavScrollView extends StatefulWidget {
  @override
  State<FavScrollView> createState() => _FavScrollViewState();
}

class _FavScrollViewState extends State<FavScrollView> {
  @override
  Widget build(BuildContext context) {
    return favFood.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              itemCount: favFood.length,
              itemBuilder: ((context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 120,
                        height: 130,
                        child: Image.asset(favFood[index].imgUrl,
                            fit: BoxFit.fitHeight),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    favFood[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      context
                                          .read<FavFood>()
                                          .rev(favFood[index]);
                                      favFood.remove(favFood[index]);
                                      context.read<FavFood>().update();
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                              Text(
                                favFood[index].desc,
                                style: TextStyle(
                                  color: favFood[index].highlight
                                      ? kPrimaryColor
                                      : Colors.grey.withOpacity(0.8),
                                  height: 0.8,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    getCurrency(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${favFood[index].price}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            ),
          )
        : Column(
            children: const [
              Text('No favourites'),
            ],
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
