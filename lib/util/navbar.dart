import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Account/account.dart';
import 'package:flutterati_codeshastra/screens/Home/home.dart';
import 'package:flutterati_codeshastra/screens/Loan/loan.dart';
import 'package:flutterati_codeshastra/screens/Profile/profile.dart';
import 'package:flutterati_codeshastra/screens/Track/track.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _selectedIndex = 0;
  //default index
  List<Widget> _widgetOptions = [
    Home(),
    Account(),
    Loan(),
    Tracking(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: _widgetOptions[_selectedIndex]),
        bottomNavigationBar: CustomLineIndicatorBottomNavbar(
          selectedColor: midnightGreenLight,
          unSelectedColor: disabledGrey,
          backgroundColor: raisinBlack.withOpacity(0.1),
          currentIndex: _selectedIndex,
          unselectedIconSize: 25,
          selectedIconSize: 30,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          enableLineIndicator: true,
          lineIndicatorWidth: 3,
          indicatorType: IndicatorType.Top,
          // gradient: LinearGradient(
          //   colors: [Colors.pink, Colors.yellow],
          // ),
          customBottomBarItems: [
            CustomBottomBarItems(
              label: 'Home',
              icon: Icons.home_rounded,
            ),
            CustomBottomBarItems(
              label: 'Account',
              icon: Icons.credit_card_rounded,
            ),
            CustomBottomBarItems(
              label: 'Loan',
              icon: Icons.monetization_on_rounded,
            ),
            CustomBottomBarItems(
              label: 'Track',
              icon: Icons.track_changes_rounded,
            ),
            CustomBottomBarItems(
              label: 'Profile',
              icon: Icons.account_circle,
            ),
          ],
        ));
  }
}
