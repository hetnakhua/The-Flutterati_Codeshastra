import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
      body: Column(
        children: [],
      ),
    );
  }
}
