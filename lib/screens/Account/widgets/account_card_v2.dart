import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/models/account.dart';
import 'package:flutterati_codeshastra/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountCardV2 extends StatelessWidget {
  const AccountCardV2({
    super.key,
    required this.account,
    required this.expenses,
  });
  final Account account;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: Theme.of(context).colorScheme.surfaceVariant,
          shadowColor: Theme.of(context).colorScheme.shadow,
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  horizontalTitleGap: 0,
                  trailing: Icon(Icons.card_membership),
                  title: Text(
                    account.name,
                  ),
                  subtitle: Text(account.bankName),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    (account.initialAmount + 100).toString(),
                    style: GoogleFonts.manrope(
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "April",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.85),
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                // AccountSummaryWidget(
                //   expenses: expenses,
                //   useAccountsList: useAccountsList,
                // ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
