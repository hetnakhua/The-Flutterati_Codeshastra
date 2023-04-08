import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileAccountCard extends StatelessWidget {
  MobileAccountCard({
    Key? key,
    required this.cardHolder,
    required this.bankName,
    //required this.cardType,
    this.onDelete,
    this.onTap,
  }) : super(key: key);

  final String cardHolder;
  final String bankName;
  //final CardType cardType;

  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  HomeController homeController = Get.put(HomeController());
  int totalIncome = 0;
  int totalExpense = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: StreamBuilder(
          stream: homeController.getUserExpenseDetails(),
          builder: (context, snapshot2) {
            if (snapshot2.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot2.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            for (int i = 0; i < snapshot2.data!.length; i++) {
              totalExpense += snapshot2.data![i].amount;
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder(
                  stream: homeController.getUserIncomeDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      totalIncome += snapshot.data![i].amount;
                    }
                    return GlassmorphicContainer(
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: 350,
                      borderRadius: 24,
                      blur: 10,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.05)
                        ],
                        // colors: [
                        //   Theme.of(context).textTheme.titleMedium!.color!.withOpacity(0.1),
                        //   Theme.of(context).textTheme.titleMedium!.color!.withOpacity(0.05),
                        // ],
                        stops: const [0.1, 1],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .color!
                              .withOpacity(0.5),
                          Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .color!
                              .withOpacity(0.5),
                        ],
                      ),
                      border: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            horizontalTitleGap: 0,
                            title: Text(bankName.toUpperCase()),
                            subtitle: Text(cardHolder.toUpperCase()),
                            leading: Icon(Icons.card_travel),
                            trailing: onDelete != null
                                ? GestureDetector(
                                    onTap: onDelete,
                                    child: Icon(
                                      Icons.delete,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Balance"),
                                    Text(
                                      "\u20B9 " +
                                          (totalIncome - totalExpense)
                                              .toString(),
                                      style: GoogleFonts.manrope(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              bottom: 16.0,
                              right: 16.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Income",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7)),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "\u20B9" + totalIncome.toString(),
                                        style: GoogleFonts.manrope(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expense",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7)),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "\u20B9" + totalExpense.toString(),
                                        style: GoogleFonts.manrope(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
