import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/expense.dart';



class MyCard extends StatelessWidget {

  final Expense expense;

  MyCard({
     required this.expense
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            expense.time.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Amount: \$${expense.amount.toString()}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Category: $expense.category',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
