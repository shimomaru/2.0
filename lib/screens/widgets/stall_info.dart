import 'package:flutter/material.dart';
import 'package:nle_app/main.dart';
import 'package:nle_app/models/stall.dart';

class StallInfo extends StatelessWidget {
  final Stall stall;

  const StallInfo({super.key, required this.stall});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    stall.name,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            stall.label,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  stall.logoUrl,
                  width: 80,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stall.desc, //
                style: TextStyle(
                  fontSize: 16,
                  color: openStall(stall) ? Colors.green : Colors.red,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outlined,
                    color: Colors.amberAccent,
                  ),
                  Text(
                    '${stall.score}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
