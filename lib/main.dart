import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Onboarding/intro_page_1.dart';
import 'package:flutterati_codeshastra/screens/Profile/login.dart';
import 'package:flutterati_codeshastra/screens/Profile/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseapp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme(
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
              brightness: Brightness.dark),
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)),
      title: 'SpendSense',
      initialRoute: '/intro',
      routes: {
        '/intro': (context) => const IntroPage1(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
