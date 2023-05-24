// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class FeedInfo extends StatelessWidget {
  const FeedInfo({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: size.height * 0.04,
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Spotify',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('May 20, 3:41 pm',
                  style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              "-\$15.00",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
