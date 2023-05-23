// ignore_for_file: non_constant_identifier_names

import 'package:cashwise/utils/bar_graph_year/bar_data_year.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraphYearly extends StatelessWidget {
  final List YearSummary;
  const MyBarGraphYearly({super.key, required this.YearSummary});

  @override
  Widget build(BuildContext context) {
    BarDataYear myBarData = BarDataYear(
      Amount2021: YearSummary[0],
      Amount2022: YearSummary[1],
      Amount2023: YearSummary[2],
    );

    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
          maxY: 3000,
          minY: -100,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 1500,
                dashArray: [1, 10],
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onBackground,
                label: HorizontalLineLabel(
                  show: true,
                  labelResolver: (line) {
                    return '\$1500';
                  },
                ),
              ),
            ],
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              axisNameSize: 50,
              drawBehindEverything: true,
              sideTitles: SideTitles(
                reservedSize: 30,
                showTitles: true,
                getTitlesWidget: getBottomTitles,
              ),
            ),
            show: true,
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

Widget getBottomTitles(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        '2021',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 1:
      text = const Text(
        '2022',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 2:
      text = const Text(
        '2023',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
