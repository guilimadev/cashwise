import 'package:cashwise/utils/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List monthSummary;
  const MyBarGraph({super.key, required this.monthSummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      JanAmount: monthSummary[0],
      FebAmount: monthSummary[1],
      MarAmount: monthSummary[2],
      AprAmount: monthSummary[3],
    );

    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
          maxY: 300,
          minY: 0,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: false,
          ),
          barGroups: myBarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                        toY: data.y,
                        color: Theme.of(context).colorScheme.onBackground,
                        width: MediaQuery.of(context).size.width * 0.1,
                        borderRadius: BorderRadius.circular(8)),
                  ],
                ),
              )
              .toList()),
    );
  }
}
