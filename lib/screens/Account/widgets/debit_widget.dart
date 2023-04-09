import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/models/expense.dart';
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DebitWidget extends StatelessWidget {
  DebitWidget({
    Key? key,
    required this.total,
    required this.expenses,
  }) : super(key: key);

  final double total;
  final List<Expense> expenses;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            "Debit",
            style: GoogleFonts.outfit(),
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
            child: StreamBuilder(
                stream: homeController.getUserExpenseDetails(),
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
                      final Expense expense = snapshot.data![index];
                      // final Account? account =
                      //     summaryController.getAccount(expenses[index].accountId);
                      // final Category? category =
                      //     summaryController.getCategory(expenses[index].categoryId);
                      // if (account == null || category == null) {
                      //   return ExpenseItemWidget(
                      //     expense: expense,
                      //     account: Account(
                      //       name: 'Transfer',
                      //       icon: Icons.wallet.codePoint,
                      //       bankName: 'Transfer bank name',
                      //       number: 'Transfer bank number',
                      //       cardType: CardType.bank,
                      //       amount: 0,
                      //     ),
                      //     category: Category(
                      //       icon: MdiIcons.bankTransfer.codePoint,
                      //       name: 'Transfer category',
                      //       color: Colors.amber.value,
                      //     ),
                      //   );
                      // }
                      return ListTile(
                        horizontalTitleGap: 4,
                        title: Text(expense.category),
                        subtitle: Text(expense.time.toString()),
                        trailing: Text(
                          '\u20B9 ${expense.amount}',
                          style: GoogleFonts.manrope(
                            textStyle: TextStyle(color: Colors.red),
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
