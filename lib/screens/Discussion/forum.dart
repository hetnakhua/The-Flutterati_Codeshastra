import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/forumpost.dart';
import 'package:flutterati_codeshastra/screens/Auth/login.dart';
import 'package:flutterati_codeshastra/screens/Discussion/add_post.dart';
import 'package:flutterati_codeshastra/screens/Discussion/post.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/my_tab.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>
    with SingleTickerProviderStateMixin {
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
              backgroundColor: raisinBlack,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Forum",
                style: TextStyle(color: white),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              elevation: 5,
              child: Icon(Icons.add),
                onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => AddPost()));
            }),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
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
                              TabCategory1(),
                              TabCategory2(),
                              TabCategory3(),
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

class TabCategory1 extends StatelessWidget {
  TabCategory1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            height: 500,
            child: ListView(
              children: [
                PostTile(name: 'Het', post: 'Should I invest in NFTs?'),
                PostTile(name: 'Nishtha', post: 'Best investments?'),
                PostTile(name: 'Abhishek', post: 'Investment help')
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class TabCategory2 extends StatelessWidget {
  TabCategory2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            height: 500,
            child: ListView(
              children: [
                PostTile(name: 'Roshni', post: 'How to save more?'),
                PostTile(name: 'Nishtha', post: 'Budgeting advice'),
                PostTile(name: 'Vatsal', post: 'Savings reducing')
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class TabCategory3 extends StatelessWidget {
  TabCategory3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            height: 500,
            child: ListView(
              children: [
                PostTile(name: 'Vaibhav', post: 'Should I take a loan?'),
                PostTile(name: 'Roshan', post: 'Student Loan Help?'),
                PostTile(name: 'Abhishek', post: 'Investment help')
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  final String name;
  final String post;
  const PostTile({Key? key, required this.name, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 100,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: outerSpaceGrey,
        ),
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(
                post,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => ForumDetailPage()));
          }, icon: Icon(Icons.chat))
        ]));
  }
}
