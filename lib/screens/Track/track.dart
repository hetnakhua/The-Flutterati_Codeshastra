import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/expense.dart';
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:flutterati_codeshastra/util/my_tab.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  HomeController homeController = Get.put(HomeController());

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

  TextEditingController _category = TextEditingController();
  TextEditingController _amount = TextEditingController();

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 200,
          child: Scaffold(
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.location_on)),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        SizedBox(width: 12),
                        StreamBuilder(
                            stream: homeController.getUserExpenseDetails(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              List<Expense> expenseList1 = snapshot.data!;
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data!.length + 1,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 400,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 24),
                                                  decoration: BoxDecoration(
                                                    color: black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      inputText(
                                                          'Category',
                                                          'eg: Food',
                                                          _category,
                                                          false),
                                                      inputText(
                                                          'Amount',
                                                          'eg: 2000',
                                                          _amount,
                                                          false),
                                                      submit(context, () {
                                                        Navigator.pop(context);
                                                      }),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Row(
                                          children: [
                                            DottedBorder(
                                              borderType: BorderType.RRect,
                                              dashPattern: [3, 3],
                                              color: midnightGreenLight,
                                              strokeWidth: 4,
                                              radius: Radius.circular(16),
                                              child: Container(
                                                width: 100,
                                                child: Center(
                                                  child: Icon(
                                                    Icons
                                                        .add_circle_outline_outlined,
                                                    size: 36,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                          ],
                                        ),
                                      );
                                    }
                                    return Container(
                                      margin: EdgeInsets.only(right: 16),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 35,
                                            height: 35,
                                            child: Icon(
                                              (expenseList1[index - 1]
                                                          .category ==
                                                      'Food')
                                                  ? Icons.food_bank_rounded
                                                  : ((expenseList1[
                                                                  index - 1]
                                                              .category ==
                                                          'Shopping')
                                                      ? Icons
                                                          .shopping_bag_rounded
                                                      : Icons
                                                          .travel_explore_rounded),
                                              size: 36,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            expenseList1[index - 1].category,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '${expenseList1[index - 1].amount}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                        SizedBox(width: 12),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Invest Now!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        investNowPage(context, 1, 'stock'),
                        investNowPage(context, 2, 'FD'),
                        investNowPage(context, 3, 'Equity'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: midnightGreenLight,
                          dotColor: disabledGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
