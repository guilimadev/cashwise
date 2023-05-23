import 'package:cashwise/utils/bar_graph_month/bar_data_month.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraphMonthly extends StatelessWidget {
  final List monthSummary;
  const MyBarGraphMonthly({super.key, required this.monthSummary});

  @override
  Widget build(BuildContext context) {
    BarDataMonth myBarData = BarDataMonth(
      JanAmount: monthSummary[0],
      FebAmount: monthSummary[1],
      MarAmount: monthSummary[2],
      AprAmount: monthSummary[3],
    );

    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
          maxY: 1000,
          minY: 0,
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 500,
                dashArray: [1, 10],
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onBackground,
                label: HorizontalLineLabel(
                  show: true,
                  labelResolver: (line) {
                    return '\$500';
                  },
                ),
              ),
            ],
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
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
        'Jan',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 1:
      text = const Text(
        'Feb',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 2:
      text = const Text(
        'Mar',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 3:
      text = const Text(
        'Apr',
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
