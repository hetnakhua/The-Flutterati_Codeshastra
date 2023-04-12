import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/account.dart';
import 'package:flutterati_codeshastra/screens/Account/accounts_page_v2.dart';
import 'package:flutterati_codeshastra/screens/Auth/auth.dart';
import 'package:flutterati_codeshastra/screens/Onboarding/intro_page_1.dart';
import 'package:flutterati_codeshastra/screens/Auth/login.dart';
import 'package:flutterati_codeshastra/screens/Auth/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  Stream<List<String>> s = Stream.fromIterable(
    [
      ['Abhishek', 'Sinha'],
      ['Vatsal', 'Shah']
    ],
  );
  List<String> st = await s.expand((element) => element).toList();
  log(st[0]);
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseapp = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appColorScheme = ColorScheme(
      primary: midnightGreenLight,
      error: pink,
      onError: pink,
      secondary: midnightGreen,
      onPrimary: midnightGreen,
      onSecondary: midnightGreenLight,
      background: raisinBlack,
      surface: outerSpaceGrey,
      onSurface: outerSpaceGrey,
      onBackground: raisinBlack,
      brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: raisinBlack,
          colorScheme: appColorScheme,
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)),
      title: 'SpendSense',
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthPage(),
        '/intro': (context) => const IntroPage1(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/accounts': (context) => AccountsPage(accounts: [
              Account(
                  name: "BOB",
                  bankName: "BOB",
                  amount: 7890,
                  number: "number",
                  initialAmount: 1253)
            ])
      },
    );
  }
}
