// ignore_for_file: prefer_const_constructors

import 'package:cashwise/utils/line_chart_week/line_chart_week.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  bool isWeekChecked = true;
  bool isMonthChecked = false;
  bool isYearChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.background),
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
                      'Analytics',
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
                                : Theme.of(context).colorScheme.onBackground,
                          ),
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
                height: size.height * 0.3,
                child: LineChartWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
