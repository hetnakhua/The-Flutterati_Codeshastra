import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/util/my_tab.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  // my tabs
  List<MyTab> myTabs = const [
    // daily tab
    MyTab(
      text: 'Daily',
    ),

    // weekly tab
    MyTab(
      text: 'Weekly',
    ),
  ];

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            tabsContainer(context, tabController!, myTabs)
          ],
        ),
      ),
    );
  }
}
