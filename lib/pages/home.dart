// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cashwise/utils/credit_card.dart';
import 'package:cashwise/utils/feed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ThemeData tema = ThemeData(fontFamily: 'Prompt');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 60.0, left: 48, right: 48, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.bars,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    FaIcon(
                      FontAwesomeIcons.user,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.31,
                width: size.width,
                child: ListView(
                  itemExtent: MediaQuery.of(context).size.width * 0.7,
                  scrollDirection: Axis.horizontal,
                  children: [CreditCard(), CreditCard(), CreditCard()],
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transactions: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontSize: size.height * 0.025),
                    ),
                  ],
                ),
              ),
              Feed(),
            ],
          ),
        ),
      ),
    );
  }
}
