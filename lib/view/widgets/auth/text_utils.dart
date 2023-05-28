import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextDecoration textDecoration;

  const TextUtils({
    required this.fontWeight,
    required this.fontSize,
    required this.text,
    required this.color,
    required this.textDecoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color,
              decoration: textDecoration)),
    );
  }
}
