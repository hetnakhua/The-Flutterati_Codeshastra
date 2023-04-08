import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

GestureDetector singInUp(BuildContext context, bool isLogin, Function clickMe) {
  return GestureDetector(
    onTap: () {
      clickMe();
    },
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: midnightGreenLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          isLogin ? "Login" : "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

Column inputText(String text, String hintText, TextEditingController controller,
    bool obscT) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // heading
      RichText(
        text: TextSpan(
          // style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: '$text ',
            ),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0.0, -7.0),
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 11),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 8),
      // textfield
      TextField(
        controller: controller,
        obscureText: obscT,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: black),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: white),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: '$hintText',
          fillColor: Colors.grey[150],
          filled: true,
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

Container balanceCard(BuildContext context) {
  return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: outerSpaceGrey),
              width: MediaQuery.of(context).size.width,
              // height: 200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total balance',
                      style: GoogleFonts.poppins(
                        color: Colors.white60,
                      ),
                    ),
                    Text(
                      '\$62,845.00',
                      style: GoogleFonts.poppins(
                          // color: Colors.white60,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'This month',
                      style: GoogleFonts.poppins(
                        color: Colors.white60,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  'Credit',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '+\$5503.00',
                              style: GoogleFonts.poppins(
                                fontSize: 16
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 60),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_drop_up_sharp,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  'Debit',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '-\$2739.00',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
}