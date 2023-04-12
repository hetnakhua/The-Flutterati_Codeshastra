import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: {
        DateTime(2023, 4, 6): 3,
        DateTime(2023, 4, 7): 7,
        DateTime(2023, 4, 8): 10,
        DateTime(2023, 4, 9): 13,
        DateTime(2023, 4, 13): 6,
      },
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 40)),
      size: 36,
      defaultColor: disabledGrey.withOpacity(0.5),
      colorMode: ColorMode.opacity,
      showText: false,
      scrollable: true,
      colorsets: {
        1: Color.fromARGB(255, 76, 175, 80),
        2: Color.fromARGB(235, 76, 175, 80),
        3: Color.fromARGB(215, 76, 175, 80),
        4: Color.fromARGB(195, 76, 175, 80),
        5: Color.fromARGB(175, 76, 175, 80),
        6: Color.fromARGB(155, 76, 175, 80),
        7: Color.fromARGB(135, 76, 175, 80),
        8: Color.fromARGB(115, 76, 175, 80),
        9: Color.fromARGB(95, 76, 175, 80),
        10: Color.fromARGB(75, 76, 175, 80),
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
