// ignore_for_file: non_constant_identifier_names

import 'package:cashwise/utils/bar_graph_week/individual_bar_week.dart';

class BarDataMonth {
  final double JanAmount;
  final double FebAmount;
  final double MarAmount;
  final double AprAmount;

  BarDataMonth({
    required this.JanAmount,
    required this.FebAmount,
    required this.MarAmount,
    required this.AprAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: JanAmount),
      IndividualBar(x: 1, y: FebAmount),
      IndividualBar(x: 2, y: MarAmount),
      IndividualBar(x: 3, y: AprAmount),
    ];
  }
}
