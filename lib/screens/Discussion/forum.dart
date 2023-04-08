import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/forumpost.dart';
import 'package:flutterati_codeshastra/screens/Auth/login.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/my_tab.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> with SingleTickerProviderStateMixin {

  final id = (FirebaseAuth.instance.currentUser?.uid).toString();
  List<ForumPostEntry> invest =
  [
    ForumPostEntry(username: 'Het', time: '8/4/23', likes: 50, dislikes: 3, text: 'Should I invest in Crypto?'),
    ForumPostEntry(username: 'Nishtha', time: '20/3/23', likes: 100, dislikes: 10, text: 'Best Investment for students?'),
    ForumPostEntry(username: 'Abhishek', time: '12/3/23', likes: 38, dislikes: 2, text: 'How much should a student invest?'),
  ];
  List<Widget> myTabs = const [
    // donut tab
    MyTab(
      text: 'Stocks',
    ),

    // burger tab
    MyTab(
      text: 'Mutual Funds',
    ),

    MyTab(
      text: 'Fixed Deposit',
    ),

    MyTab(
      text: 'Other',
    ),
  ];

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
                  text: 'Forum',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    // color: Colors.black,
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => LoginScreen()));
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
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(height: 25),
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
                                      text: 'Investing',
                                    ),
                                    Tab(
                                      text: 'Savings',
                                    ),
                                    Tab(
                                      text: 'Loans',
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
                              TabCategory(l: invest,),
                              TabCategory(l: invest),
                              TabCategory(l: invest),
                            ],
                          ),
                        ),
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

class TabCategory extends StatelessWidget {
  final List<ForumPostEntry> l;
  TabCategory({super.key, required this.l});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: midnightGreenLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Add Question",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
