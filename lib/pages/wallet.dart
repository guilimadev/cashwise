// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:io';

import 'package:cashwise/utils/bar_graph_month/bar_graph_month.dart';
import 'package:cashwise/utils/bar_graph_week/bar_graph_week.dart';
import 'package:cashwise/utils/bar_graph_year/bar_graph_year.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
  }

  bool isWeekChecked = true;
  bool isMonthChecked = false;
  bool isYearChecked = false;

  List<double> expansesWeekly = [
    100.0,
    200.0,
    150.0,
    55.5,
    57.5,
    75.5,
    155.5,
  ];

  List<double> expansesMonthly = [
    600.0,
    700.0,
    450.0,
    555.5,
  ];
  List<double> expansesYearly = [
    1030.0,
    2000.0,
    1050.0,
  ];
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
                    Text(
                      'Wallet',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    FaIcon(
                      FontAwesomeIcons.user,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        color: isWeekChecked
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Week',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isWeekChecked
                                  ? Theme.of(context).colorScheme.background
                                  : Theme.of(context).colorScheme.onBackground),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isWeekChecked = true;
                        isMonthChecked = false;
                        isYearChecked = false;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        color: isMonthChecked
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Month',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isMonthChecked
                                  ? Theme.of(context).colorScheme.background
                                  : Theme.of(context).colorScheme.onBackground),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isWeekChecked = false;
                        isMonthChecked = true;
                        isYearChecked = false;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        color: isYearChecked
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Year',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isYearChecked
                                  ? Theme.of(context).colorScheme.background
                                  : Theme.of(context).colorScheme.onBackground),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isWeekChecked = false;
                        isMonthChecked = false;
                        isYearChecked = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: isWeekChecked
                    ? MyBarGraphWeekly(
                        weekSummary: expansesWeekly,
                      )
                    : isMonthChecked
                        ? MyBarGraphMonthly(
                            monthSummary: expansesMonthly,
                          )
                        : MyBarGraphYearly(
                            YearSummary: expansesYearly,
                          ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  height: size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Expanses',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      FaIcon(FontAwesomeIcons.arrowTrendUp),
                      Text(
                        "-\$15.00",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  height: size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Incomes',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      FaIcon(FontAwesomeIcons.arrowTrendUp),
                      Text(
                        "\$1500.00",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
