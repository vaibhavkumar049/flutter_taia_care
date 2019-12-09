import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Styles {
  //colors
  static const Color darkFontColor = Color(0x232323);
  static const Color IconsNTextColor = Color(0x787878);
  static const Color greyTextColor = Color.fromRGBO(120, 120, 120, 1);
  static const Color strongRed = Color.fromRGBO(212, 0, 28, 1);
  static const Color lightRed = Color.fromRGBO(255, 91, 91, 1);
  static const Color boxesNarrowsGrey = Color.fromRGBO(227, 227, 227, 1);
//rgb(255,91,91)
  static const Color taiaGreen = Color.fromRGBO(0, 212, 183, 1);


  static const Color transparent = Colors.transparent;

  static const Color textDarkColor = Color(0xFF343434);
  static const Color whiteColor = Colors.white;

  static const Color redColor = Color(0xFFC82727);
  static const Color textFieldGreyColor = Color(0xFFFFFFFF);
  static const Color darkGreenColor = Color(0xFF00A056);
  static const Color lightGreenColor = Color(0xFF96C160);
  static const Color caseOutlineColor = Color(0xFF2E7D32);

  static const Color darkTextIconColor = Color(0xFF95C160);
  static const Color lightTextIconColor = Color(0xFFD7D8DA);
  static const Color mediumTextIconColor = Color(0xFF9EA0A5);

  static const Color lightTextColor = Color(0xFFD7D8DA);
  static const Color mediumTextColor = mediumTextIconColor;
  static const Color darkTextColor = textDarkColor;

  static const Color dismissibleBackgroundColor = Color(0xFFF2f2f2);

  static const LinearGradient appBackGradient = LinearGradient(
      colors: [darkGreenColor, lightGreenColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

/*  //Strings
  static const TextStyle boldMediumSizedWhiteTextStyle = TextStyle(
      color: Styles.whiteColor, fontWeight: FontWeight.w500, fontSize: 16);
  static const TextStyle smallGreenTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto",
      color: const Color(0xff228425),
      fontStyle: FontStyle.normal,
      fontSize: 12);
  static const TextStyle smallMediumOkTextStyle =
      TextStyle(color: Styles.whiteColor, fontSize: 12);
  static const TextStyle caseItemNameTextStyle = TextStyle(
      color: Styles.blackColor, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle caseItemDateTextStyle = TextStyle(
      color: Styles.blackColor, fontSize: 18, fontWeight: FontWeight.bold);*/
}
