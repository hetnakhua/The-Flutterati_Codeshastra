import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../util/my_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // my tabs
  List<Widget> myTabs = const [
    // donut tab
    MyTab(
      text: 'Daily',
    ),

    // burger tab
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
      body: Column(
        children: [
          Text('home'),
        ],
      ),
    );
  }
}
