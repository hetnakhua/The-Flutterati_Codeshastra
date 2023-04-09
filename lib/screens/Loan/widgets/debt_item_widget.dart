import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/loan.dart';

class DebtItemWidget extends StatelessWidget {
  const DebtItemWidget({
    super.key,
    required this.debt,
  });
  final Loan debt;
  @override
  Widget build(BuildContext context) {
    // final List<Transaction> transactions =
    //     value.getTransactionsFromId(debt.superId ?? 0).toEntities();
    // final double amount = transactions.fold<double>(
    //     0, (previousValue, element) => previousValue + element.amount);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
            children: [
              ListTile(
                title: Text(
                  debt.categoryName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: midnightGreenLight, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "\u20B9" + (debt.totalAmount).toString(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 4000 / debt.totalAmount,
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '${debt.daysLeft}  Days Left',
                        style: TextStyle(color: white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, right: 14),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.punch_clock,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      label: Text(
                        "\u20B9 600 per month",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: white.withOpacity(0.5),
                            ),
                      ),
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        final controller = TextEditingController();
                        showModalBottomSheet(
                          context: context,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width >= 700
                                ? 700
                                : double.infinity,
                          ),
                          builder: (context) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    horizontalTitleGap: 0,
                                    title: Text(
                                      "Label",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: TextFormField(
                                      controller: controller,
                                      decoration: InputDecoration(
                                        hintText: "Enter Amount",
                                      ),

                                      keyboardType: TextInputType.number,
                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter
                                      //       .digitsOnly,
                                      // ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                      ),
                                      onPressed: () {
                                        // final double amount =
                                        //     double.tryParse(
                                        //             controller.text) ??
                                        //         0;
                                        // getIt.get<DebtsBloc>().add(
                                        //       AddTransactionToDebtEvent(
                                        //         debt,
                                        //         amount,
                                        //       ),
                                        //     );

                                        // Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Update Label",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
