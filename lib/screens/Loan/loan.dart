import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/loan.dart' as L;
import 'package:flutterati_codeshastra/screens/Loan/widgets/debt_item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Loan extends StatefulWidget {
  const Loan({super.key});

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: raisinBlack,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Loan",
          style: TextStyle(color: white),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "My Loans",
              style: GoogleFonts.outfit(fontSize: 20),
            ),
          ),
          DebtItemWidget(
            debt: L.Loan(
                daysLeft: 32,
                totalAmount: 5800,
                categoryName: "Electronics",
                emiPerMonth: 5000),
          ),
        ],
      ),
    );
  }
}
