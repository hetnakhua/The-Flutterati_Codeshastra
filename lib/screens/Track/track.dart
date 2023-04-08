import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/expense.dart';
import 'package:flutterati_codeshastra/util/my_tab.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';
import 'package:dotted_border/dotted_border.dart';

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

  // my expenses or transactions whatever
  List<Expense> expenseList = [
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Food',
        lat: 23.09,
        lng: 45.03),
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Shopping',
        lat: 23.09,
        lng: 45.03),
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Travel',
        lat: 23.09,
        lng: 45.03),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: raisinBlack,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Track",
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            tabsContainer(context, tabController!, myTabs),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expenses',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.location_on)),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [3, 3],
                      color: midnightGreenLight,
                      strokeWidth: 3,
                      radius: Radius.circular(16),
                      child: Container(
                        // height: 120,
                        width: 100,
                        child: Center(
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            size: 36,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: expenseList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: 100,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: midnightGreenLight,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    child: Icon(
                                      (expenseList[index].category == 'Food')
                                          ? Icons.food_bank_rounded
                                          : ((expenseList[index].category ==
                                                  'Shopping')
                                              ? Icons.shopping_bag_rounded
                                              : Icons.travel_explore_rounded),
                                      size: 36,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    expenseList[index].category,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '${expenseList[index].amount}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 24),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Container(
//                     width: 100,
//                     height: 120,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: midnightGreenLight, width: 3),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 35,
//                           height: 35,
//                           decoration: BoxDecoration(
//                             color: midnightGreenLight,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Icon(Icons.food_bank_rounded),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           'Food',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         SizedBox(height: 2),
//                         Text(
//                           "\Rs. 2000",
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),