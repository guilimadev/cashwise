import 'package:cashwise/utils/bar_graph_week/bar_data_week.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraphWeekly extends StatelessWidget {
  final List weekSummary;
  const MyBarGraphWeekly({super.key, required this.weekSummary});

  @override
  Widget build(BuildContext context) {
    BarDataWeek myBarData = BarDataWeek(
      MonAmount: weekSummary[0],
      TueAmount: weekSummary[1],
      WedAmount: weekSummary[2],
      ThurAmount: weekSummary[3],
      FriAmount: weekSummary[4],
      SatAmount: weekSummary[5],
      SunAmount: weekSummary[6],
    );

    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
          maxY: 300,
          minY: 0,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 150,
                dashArray: [1, 10],
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onBackground,
                label: HorizontalLineLabel(
                  show: true,
                  labelResolver: (line) {
                    return '\$150';
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
