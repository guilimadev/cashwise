// ignore_for_file: non_constant_identifier_names

import 'package:cashwise/utils/bar_graph_week/individual_bar_week.dart';

class BarDataYear {
  final double Amount2021;
  final double Amount2022;
  final double Amount2023;

  BarDataYear({
    required this.Amount2021,
    required this.Amount2022,
    required this.Amount2023,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: Amount2021),
      IndividualBar(x: 1, y: Amount2022),
      IndividualBar(x: 2, y: Amount2023),
    ];
  }
}
