// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  TextUtil({super.key, required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: size ?? 16,
          fontWeight: weight == null ? FontWeight.w600 : FontWeight.w700),
    );
    //   style: GoogleFonts.amiriQuran(
    //       color: color ?? Colors.white,
    //       fontSize: size ?? 20,
    //       fontWeight: weight == null ? FontWeight.w600 : FontWeight.w700),
    // );
  }
}
