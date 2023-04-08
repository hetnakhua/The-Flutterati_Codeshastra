import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/models/income.dart';
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditWidget extends StatelessWidget {
  const CreditWidget({
    Key? key,
    required this.total,
  }) : super(key: key);

  final double total;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            "Credit",
            style: GoogleFonts.outfit(
                // fontWeight: FontWeight.w600,
                // textStyle: Theme.of(context).textTheme.titleMedium,
                // color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Theme.of(context).colorScheme.surfaceVariant,
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
            shadowColor: Theme.of(context).colorScheme.shadow,
            child: StreamBuilder<List<Income>>(
                stream: homeController.getUserIncomeDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      final Income income = snapshot.data![index];

                      return ListTile(
                        horizontalTitleGap: 4,
                        title: Text(income.Source),
                        subtitle: Text(income.Date.toString()),
                        trailing: Text(
                          '\u20B9 ${income.amount}',
                          style: GoogleFonts.manrope(
                            textStyle: TextStyle(color: Colors.green),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}
