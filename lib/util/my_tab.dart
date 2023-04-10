import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTab extends StatelessWidget {
  final String text;
  const MyTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(text, style: GoogleFonts.poppins()));
  }
}
