import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Auth/login.dart';
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());
  List<String> top3 = [
    'Jay',
    'Divya',
    'Shreya',
  ];
  List<String> userList = [
    'Het',
    'Nishtha',
    'Vatsal',
    'Abhishek',
    'Anjali',
    'Rahul'
  ];

  List<String> articles = [
    'Income tax calculator',
    'How to tax save?',
    'Zero income tax 11 lakh salary',
  ];
  @override
  void initState() {
    // TODO: implement initState
    homeController.getLeaderboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // homeController.addExpense(
    //     expense: Expense(
    //         time: DateTime(2022),
    //         amount: 100,
    //         category: "Shopping",
    //         lat: 19.21,
    //         lng: 72.1));
    // homeController.addIncome(
    //     income: Income(Date: DateTime(2022), amount: 100, Source: "Mom"));
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 500,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: FutureBuilder(
                  future: homeController.getCurrentUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }
                    return RichText(
                      text: TextSpan(
                        text: 'Hey ',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          // color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: homeController.currentUser.name,
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              // color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
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
                  // Text('hiii'),
                  SizedBox(height: 20),

                  balanceCard(context),

                  SizedBox(height: 24),

                  Text(
                    'Leaderboard',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/crown.png'),
                    ],
                  ),

                  SizedBox(height: 40),

                  Column(
                    children: [
                      // top 3
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        // height: 160,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: outerSpaceGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            leaderboardTop3PerUser(top3, 2),
                            Positioned(
                              top: -60,
                              left: MediaQuery.of(context).size.width / 3.5,
                              child: leaderboardTop3PerUser(top3, 1),
                            ),
                            Positioned(
                              right: 0,
                              child: leaderboardTop3PerUser(top3, 3),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // rest users
                      Container(
                        height: 260,
                        decoration: BoxDecoration(
                          color: outerSpaceGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView.builder(
                          itemCount: userList.length,
                          shrinkWrap: true,
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final _newindex = index + 4;
                            return Column(
                              children: [
                                ListTile(
                                  leading: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: midnightGreen,
                                        radius: 24,
                                        child: CircleAvatar(
                                          child: Image.asset(
                                              'assets/profile avatar.png'),
                                          radius: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 12,
                                        right: -8,
                                        child: CircleAvatar(
                                          backgroundColor: midnightGreen,
                                          radius: 10,
                                        ),
                                      ),
                                      Positioned(
                                        top: 14,
                                        right: -3,
                                        child: Text(
                                          '$_newindex',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Text(userList[index]),
                                ),
                                SizedBox(height: 2),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32),

                  // finance articles
                  Text(
                    'Let\'s read more!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(height: 16),

                  ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/article img.png'),
                                  ),
                                  color: white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                articles[index],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                        ],
                      );
                    },
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
