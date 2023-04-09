import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';

import '../../models/expense.dart';



class MyCard extends StatelessWidget {

  final Expense expense;

  MyCard({
     required this.expense
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 80,

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,

          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: raisinBlack
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            expense.time.toString(),
            style: TextStyle(
              fontSize: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Amount: \$${expense.amount.toString()}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text(
            'Category: $expense.category',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
