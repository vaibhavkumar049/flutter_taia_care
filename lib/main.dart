import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taia_care/src/app.dart';
import 'package:flutter_taia_care/src/preferences/shared_pref.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/utils/locator.dart';


void main() {
  Prefs.init();
  setupLocator();
  runApp(MyApp());
 // runFirebaseQuery();
}


