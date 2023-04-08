import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Auth/auth.dart';
import 'package:flutterati_codeshastra/screens/Onboarding/intro_page_1.dart';
import 'package:flutterati_codeshastra/screens/Auth/login.dart';
import 'package:flutterati_codeshastra/screens/Auth/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
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
        '/auth': (context) => AuthPage(),
        '/intro': (context) => const IntroPage1(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
