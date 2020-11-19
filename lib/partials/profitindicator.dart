import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ProfitIndicator extends StatefulWidget {
  ProfitIndicator({Key key}) : super(key: key);

  @override
  _ProfitIndicatorState createState() => _ProfitIndicatorState();
}

class _ProfitIndicatorState extends State<ProfitIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        child: LiquidCircularProgressIndicator(
            value: 0.6, // Defaults to 0.5.
            valueColor: AlwaysStoppedAnimation(Colors
                .cyan[100]), // Defaults to the current Theme's accentColor.
            backgroundColor: Colors
                .white, // Defaults to the current Theme's backgroundColor.
            borderColor: Colors.teal,
            borderWidth: 2.0,
            direction: Axis
                .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
            center: Text(
              "60%",
              style: TextStyle(fontSize: 40, color: Colors.teal),
            )));
  }
}
