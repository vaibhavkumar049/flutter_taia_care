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
  static const Color taiaGreenLight = Color.fromRGBO(7, 229, 169, 1);
  static const Color lightGrey = Color.fromRGBO(192, 192, 192, 1);
  static const Color veryLightGrey = Color.fromRGBO(250, 250, 250, 1);
  //rgb(7,229,169)
  //static const Color lightTaiaGreen = Color.fromRGBO(0, 212, 183, 1);
  static const Color chatBubbleGrey = Color.fromRGBO(240, 240, 240, 1);

  static const Color lightBlue = Color.fromRGBO(80, 167, 255, 1);
  static const Color lightCyan = Color.fromRGBO(115, 230, 255, 1);
  static const Color softViolet = Color.fromRGBO(198, 112, 232, 1);
  static const Color softPink = Color.fromRGBO(254, 140, 199, 1);
  static const Color lightRedIcon = Color.fromRGBO(255, 147, 123, 1);
  static const Color lightYellow = Color.fromRGBO(255, 216, 92, 1);

  static const LinearGradient appBackGradient = LinearGradient(
      colors: [taiaGreen, taiaGreenLight],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);



  static const Color transparent = Colors.transparent;

  static const Color textDarkColor = Color(0xFF343434);
  static const Color whiteColor = Colors.white;




}
