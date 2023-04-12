import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/screens/Track/line%20chart/line_chart_sample2.dart';

class TabDaily extends StatelessWidget {
  const TabDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        SizedBox(height: 200, child: LineChartSample2()),
      ],
    );
  }
}
