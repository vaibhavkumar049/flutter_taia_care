import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';

class CustomAppBar{
  static buildAppBar({BuildContext context,String title}){
    return AppBar(
      leading: IconButton(icon: Icon( Icons.arrow_back, color: Styles.whiteColor,), onPressed: (){ Navigator.of(context).pop();}),
      backgroundColor: Styles.taiaGreen,
      title: Text(title, style: TextStyle(color: Styles.whiteColor),),
      centerTitle: true,
    );
  }
}