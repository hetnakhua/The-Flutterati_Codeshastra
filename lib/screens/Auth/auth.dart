import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/screens/Home/home.dart';

import 'package:flutterati_codeshastra/screens/Onboarding/intro_page_1.dart';
import 'package:flutterati_codeshastra/util/navbar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyNavbar();
          } else {
            return const IntroPage1();
          }
        },
      ),
    );
  }
}
