import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Track/Tabs/Tab_daily.dart';
import 'package:flutterati_codeshastra/screens/Track/Tabs/Tab_weekly.dart';
import 'package:flutterati_codeshastra/util/my_tab.dart';

import 'package:flutterati_codeshastra/models/income.dart';
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

GestureDetector singInUp(BuildContext context, bool isLogin, Function clickMe) {
  return GestureDetector(
    onTap: () {
      clickMe();
    },
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: midnightGreenLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          isLogin ? "Login" : "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

Column inputText(String text, String hintText, TextEditingController controller,
    bool obscT) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // heading
      RichText(
        text: TextSpan(
          // style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: '$text ',
            ),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0.0, -7.0),
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 11),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 8),
      // textfield
      TextField(
        controller: controller,
        obscureText: obscT,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: black),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: white),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: '$hintText',
          fillColor: Colors.grey[150],
          filled: true,
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

Container tabsContainer(
    BuildContext context, TabController tabController, List<MyTab> myTabs) {
  return Container(
    height: 240, // MediaQuery.of(context).size.height,
    // color: pink,
    child: Column(
      children: [
        // SizedBox(height: 50),
        Container(
          // height: 50,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: outerSpaceGrey, borderRadius: BorderRadius.circular(16)),
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
                  tabs: myTabs,
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
  );
}

Column leaderboardTop3PerUser(List<String> top3, int rank) {
  return Column(
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: midnightGreen,
            radius: 48,
            child: CircleAvatar(
              child: Image.asset('assets/profile avatar.png'),
              radius: 42,
            ),
          ),
          Positioned(
            bottom: -8,
            right: 36,
            child: CircleAvatar(
              backgroundColor: midnightGreen,
              radius: 14,
            ),
          ),
          Positioned(
            bottom: -6,
            right: 44,
            child: Text(
              '$rank',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      SizedBox(height: 16),
      Text(
        top3[rank - 1],
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget balanceCard(BuildContext context) {
  HomeController homeController = Get.put(HomeController());
  return StreamBuilder<List<Income>>(
      stream: homeController.getUserIncomeDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (snapshot.hasError) {
        } else {
          List<Income> incomes = snapshot.data!;
          int totalIncome = 0;
          for (int i = 0; i < snapshot.data!.length; i++) {
            totalIncome += incomes[i].amount;
          }
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: outerSpaceGrey),
            width: MediaQuery.of(context).size.width,
            // height: 200,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total balance',
                    style: GoogleFonts.poppins(
                      color: Colors.white60,
                    ),
                  ),
                  Text(
                    '\$62,845.00',
                    style: GoogleFonts.poppins(
                        // color: Colors.white60,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'This month',
                    style: GoogleFonts.poppins(
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.green,
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Credit',
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '+\u20B9${totalIncome}',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(width: 60),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_up_sharp,
                                color: Colors.red,
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Debit',
                                style: GoogleFonts.poppins(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '-\$2739.00',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      });
}

Container investNowPage(BuildContext context, int pg) {
  return Container(
    padding: EdgeInsets.all(16),
    width: 200,
    height: 150,
    decoration: BoxDecoration(
      color: outerSpaceGrey,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text('page $pg'),
  );
}

GestureDetector submit(BuildContext context, Function clickMe) {
  return GestureDetector(
    onTap: () {
      clickMe();
    },
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: midnightGreenLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
