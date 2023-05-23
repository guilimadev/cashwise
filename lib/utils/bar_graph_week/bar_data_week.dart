// ignore_for_file: non_constant_identifier_names

import 'package:cashwise/utils/bar_graph_week/individual_bar_week.dart';

class BarDataWeek {
  final double MonAmount;
  final double TueAmount;
  final double WedAmount;
  final double ThurAmount;
  final double FriAmount;
  final double SatAmount;
  final double SunAmount;

  BarDataWeek({
    required this.MonAmount,
    required this.TueAmount,
    required this.WedAmount,
    required this.ThurAmount,
    required this.FriAmount,
    required this.SatAmount,
    required this.SunAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: MonAmount),
      IndividualBar(x: 1, y: TueAmount),
      IndividualBar(x: 2, y: WedAmount),
      IndividualBar(x: 3, y: ThurAmount),
      IndividualBar(x: 4, y: FriAmount),
      IndividualBar(x: 5, y: SatAmount),
      IndividualBar(x: 6, y: SunAmount),
    ];
  }
}
