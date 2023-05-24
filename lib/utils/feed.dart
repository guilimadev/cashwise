// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cashwise/utils/feed_info.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FeedInfo(
              icon: Icons.abc,
            ),
            FeedInfo(icon: Icons.restaurant),
            FeedInfo(icon: Icons.ac_unit_rounded),
            FeedInfo(icon: Icons.access_time_outlined),
            FeedInfo(icon: Icons.media_bluetooth_off),
            FeedInfo(icon: Icons.account_circle_rounded),
          ],
        ),
      ),
    );
  }
}
