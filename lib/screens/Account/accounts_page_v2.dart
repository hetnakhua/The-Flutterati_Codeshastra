import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/account.dart';
import 'package:flutterati_codeshastra/models/expense.dart';
import 'package:flutterati_codeshastra/screens/Account/widgets/account_card.dart';
import 'package:flutterati_codeshastra/screens/Account/widgets/account_card_v2.dart';
import 'package:flutterati_codeshastra/util/lava/lava_clock.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({
    super.key,
    required this.accounts,
  });

  final List<Account> accounts;
  final List<Expense> expenses = [];

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
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 124),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  return MobileAccountCard(
                    totalBalance: "zxcs",
                    cardHolder: "Vatsal Shah",
                    bankName: "Bank Of Baroda",
                    income: "\u20B9 6789",
                    expense: "\u20B9 789",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
