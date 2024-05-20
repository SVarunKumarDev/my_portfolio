import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum HType {
  h1 /*h1=48.0*/,
  h2 /*h2=38.0*/,
  h3 /*h3=28.0*/,
  h4 /*h4=24.0*/,
  h5 /*h5=22.0*/,
  h6 /*h6=20.0*/,
  h7 /*h7=18.0*/
}

class MyThemeStyles {
  /* Header TextStyle */
  static TextStyle headingTextStyle(HType htype,
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: setFontSize(htype),
        fontWeight: FontWeight.w400,
        decoration: decoration);
  }

  static TextStyle headingMediumTextStyle(HType htype,
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: setFontSize(htype),
        fontWeight: FontWeight.w500,
        decoration: decoration);
  }

  static TextStyle headingSemiTextStyle(HType htype,
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: setFontSize(htype),
        fontWeight: FontWeight.w600,
        decoration: decoration);
  }

  static TextStyle headingBoldTextStyle(HType htype,
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: setFontSize(htype),
        fontWeight: FontWeight.w700,
        decoration: decoration);
  }

  /* Title TextStyle */
  static TextStyle titleTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        decoration: decoration);
  }

  static TextStyle titleMediumTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        decoration: decoration);
  }

  static TextStyle titleSemiTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        decoration: decoration);
  }

  static TextStyle titleBoldTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        decoration: decoration);
  }

  /* SubTitle TextStyle */
  static TextStyle subTitleTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: decoration);
  }

  static TextStyle subTitleMediumTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: decoration);
  }

  static TextStyle subTitleSemiTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        decoration: decoration);
  }

  static TextStyle subTitleBoldTextStyle(
      {Color? textColor, TextDecoration? decoration = TextDecoration.none}) {
    return GoogleFonts.raleway(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        decoration: decoration);
  }
}

double setFontSize(HType htype) {
  double returnData = 24.0;
  if (htype == HType.h1) {
    returnData = 48.0;
  } else if (htype == HType.h2) {
    returnData = 38.0;
  } else if (htype == HType.h3) {
    returnData = 28.0;
  } else if (htype == HType.h4) {
    returnData = 24.0;
  } else if (htype == HType.h5) {
    returnData = 22.0;
  } else if (htype == HType.h6) {
    returnData = 20.0;
  } else if (htype == HType.h7) {
    returnData = 18.0;
  }
  return returnData;
}
