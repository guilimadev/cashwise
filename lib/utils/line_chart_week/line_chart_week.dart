// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key});

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 13,
          minY: -5,
          maxY: 15,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles:
                  SideTitles(showTitles: true, interval: 10, reservedSize: 50),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 50,
                getTitlesWidget: LineTitles,
              ),
            ),
          ),
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: const Color(0xff37434d),
                width: 10,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 2.5),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              barWidth: 5,
            ),
          ],
        ),
      );
}

Widget LineTitles(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'Mon',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 1:
      text = const Text(
        'Tue',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 2:
      text = const Text(
        'Wed',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 3:
      text = const Text(
        'Thr',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 4:
      text = const Text(
        'Fri',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 5:
      text = const Text(
        'Sat',
        style: TextStyle(
            fontFamily: 'Prompt',
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      );
      break;
    case 6:
      text = const Text(
        'Sun',
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
