import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Home/Tabs/Tab_daily.dart';
import 'package:flutterati_codeshastra/screens/Home/Tabs/Tab_weekly.dart';
<<<<<<< HEAD
=======
import 'package:flutterati_codeshastra/screens/Auth/login.dart';
>>>>>>> dae0b10e400994d8f7cf2f5d27bd91624711f520
import 'package:flutterati_codeshastra/util/re_use.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: RichText(
                text: TextSpan(
                  text: 'Hey ',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    // color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Het!',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        // color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/profile avatar.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                  ),
                  onTap: () {},
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed out");
                    });
                  },
                  icon: Icon(
                    Icons.logout_rounded,
                    color: white,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('hiii'),
                  SizedBox(height: 20),

                  balanceCard(context),

                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Container(
                          // height: 50,
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: outerSpaceGrey,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: TabBar(
                                  unselectedLabelColor: Colors.white,
                                  labelColor: Colors.black,
                                  indicatorColor: Colors.white,
                                  indicatorWeight: 2,
                                  indicator: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  controller: tabController,
                                  tabs: [
                                    Tab(
                                      text: 'Daily',
                                    ),
                                    Tab(
                                      text: 'Weekly',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              TabDaily(),
                              TabWeekly(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
