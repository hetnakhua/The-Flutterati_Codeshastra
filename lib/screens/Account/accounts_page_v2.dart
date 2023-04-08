import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/account.dart';
import 'package:flutterati_codeshastra/models/expense.dart';
import 'package:flutterati_codeshastra/models/income.dart';
import 'package:flutterati_codeshastra/screens/Account/widgets/account_card.dart';

import 'package:flutterati_codeshastra/screens/Account/widgets/credit_widget.dart';
import 'package:flutterati_codeshastra/screens/Account/widgets/debit_widget.dart';
import 'package:flutterati_codeshastra/util/lava/lava_clock.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({
    super.key,
    required this.accounts,
  });

  final List<Account> accounts;
  final List<Expense> expenses = [
    Expense(
        time: DateTime(2023),
        amount: 263,
        category: "Food",
        lat: 23.74,
        lng: 45.102)
  ];
  final List<Income> incomes = [
    Income(Source: "Mom", amount: 120, Date: DateTime(2023))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: raisinBlack,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Account",
          style: TextStyle(color: white),
        ),
      ),
      body: ListView(
        children: [
          LavaAnimation(
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padEnds: true,
                pageSnapping: true,
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  return MobileAccountCard(
                    cardHolder: "Vatsal Shah",
                    bankName: "Bank Of Baroda",
                  );
                },
              ),
            ),
          ),
          DebitWidget(
            total: 896.452,
            expenses: expenses,
          ),
          CreditWidget(total: 452)
        ],
      ),
    );
  }
}
