import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Home/home.dart';
import 'package:flutterati_codeshastra/screens/Auth/register.dart';
import 'package:flutterati_codeshastra/util/navbar.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  var _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // logo
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 48, 0),
                  child: Image.asset('assets/SpendSense logo sq.png'),
                ),
                SizedBox(height: 60),

                // inputText('Name', 'eg: Het Nakhua', controller, obscT),
                inputText('Email', 'eg: hetnakhua@gmail.com', _email, false),
                inputText('Password', 'eg: #het493', _pass, true),

                SizedBox(
                  height: 40,
                ),

                singInUp(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email.text, password: _pass.text)
                      .then((value) {
                    setState(() => _error = 'Signed In Successfully');
                    print(_error);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => MyNavbar()));
                  }).onError((error, stackTrace) {
                    setState(() => _error = error
                        .toString()
                        .substring(error.toString().indexOf(']') + 2));
                    print(_error);
                  });
                }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                signUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Do not have an account? ",
          // style: TextStyle(color: black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: Text(
            "Register!",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
