import 'package:flutter/material.dart';
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
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
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
                stall.desc,
                style: const TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outlined,
                    color: Colors.amber,
                  ),
                  Text(
                    '${stall.score}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
