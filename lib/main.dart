import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taia_care/src/app.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness:
          Brightness.light //or set color with: Color(0xFF0000FF)
      ));
  runApp(MyApp());
  runFirebaseQuery();
}

void runFirebaseQuery() {
  // print(DateTime.fromMillisecondsSinceEpoch(1572509161526));
//  /FirestoreProvider().deleteNote();
//  List<String> sList = List();
//  String s = "dbbd1572686483691";
//  String p = "";
//  for (int i = 0; i < s.length; i++) {
//    p = p + s[i];
//    sList.add(p);
//  }
//
//  print(sList);
}
