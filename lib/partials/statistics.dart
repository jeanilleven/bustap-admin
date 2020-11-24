import 'package:flutter/material.dart';
import 'partials.dart';
import '../common/packages.dart';

class Chart extends StatefulWidget {
  Chart({Key key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  bool isShowingMainData;

  final List<Color> gradientColors = [
    const Color(0xFF4FC3F7),
    const Color(0xFF03A9F4)
  ];
  @override
  Widget build(BuildContext context) => LineChart(LineChartData(
          minX: 0,
          maxX: 15,
          minY: 0,
          maxY: 10,
          backgroundColor: Colors.white,
          gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                    color: Colors.blueGrey[200],
                    strokeWidth: 0.3,
                    dashArray: [10, 10, 10]);
              }),
          borderData: FlBorderData(show: false),
          titlesData: LineTitles.getTitleData(),
          lineBarsData: [
            LineChartBarData(
                isCurved: true,
                spots: [
                  FlSpot(0, 3),
                  FlSpot(2, 4),
                  FlSpot(3, 2),
                  FlSpot(5, 5),
                  FlSpot(7, 1),
                  FlSpot(8, 0),
                ],
                colors: gradientColors,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.1))
                        .toList()))
          ]));
}
