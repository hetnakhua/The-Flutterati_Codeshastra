import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileAccountCard extends StatelessWidget {
  const MobileAccountCard({
    Key? key,
    required this.totalBalance,
    required this.cardHolder,
    required this.bankName,
    //required this.cardType,
    this.onDelete,
    this.onTap,
    required this.income,
    required this.expense,
  }) : super(key: key);

  final String totalBalance;
  final String cardHolder;
  final String bankName;
  //final CardType cardType;
  final String income, expense;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GlassmorphicContainer(
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
              Theme.of(context).textTheme.titleMedium!.color!.withOpacity(0.5),
              Theme.of(context).textTheme.titleMedium!.color!.withOpacity(0.5),
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
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Balance"),
                        Text(
                          totalBalance,
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
                    ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.75),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            income,
                            style: GoogleFonts.manrope(
                              textStyle: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expense",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(0.75),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            expense,
                            style: GoogleFonts.manrope(
                              textStyle: Theme.of(context).textTheme.titleLarge,
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
        ),
      ),
    );
  }
}
