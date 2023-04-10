import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Home/home.dart';
import 'package:flutterati_codeshastra/screens/Profile/heat_map.dart';
import 'package:flutterati_codeshastra/util/navbar.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: outerSpaceGrey,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => MyNavbar()));
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: white,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: outerSpaceGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 100),
                    bottomRight: Radius.elliptical(200, 100),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 120,
              ),
              Positioned(
                bottom: -50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile avatar.png'),
                  radius: 70,
                ),
              ),
            ],
          ),
          SizedBox(height: (10 + 50)),
          // name
              Text(
                'Het Nakhua',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),

              // email id
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'hetsnakhua@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              MyHeatMap(),
        ],
      ),
    );
  }
}
