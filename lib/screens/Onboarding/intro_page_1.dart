import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/util/lava/lava_clock.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: raisinBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LavaAnimation(
          color: midnightGreenLight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "SpendSense",
                  style: TextStyle(fontSize: 50, color: white),
                ),
                Text(
                  "Simple way to help control your savings",
                  style: TextStyle(fontSize: 20, color: white),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    ListTile(
                      horizontalTitleGap: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      dense: true,
                      title: Text(
                        "Manage your money with our app",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      horizontalTitleGap: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      dense: true,
                      title: Text(
                        "Easy expense tracking for a better budget",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      horizontalTitleGap: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      dense: true,
                      title: Text(
                        "Stay on top of your expenses, anytime, anywhere",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(18)),
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            child: Text(
              "Get Started",
              style: TextStyle(color: white),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
