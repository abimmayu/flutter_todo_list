import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headingBold = GoogleFonts.montserrat(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingNormal = GoogleFonts.montserrat(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );
  static TextStyle bigTextRegular = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bigTextSemibold = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static TextStyle regularText = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle normalText = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle tinyText = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
