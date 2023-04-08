import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTab extends StatelessWidget {
  final String text;
  const MyTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: GoogleFonts.poppins(),)
      ),
    );
  }
}
