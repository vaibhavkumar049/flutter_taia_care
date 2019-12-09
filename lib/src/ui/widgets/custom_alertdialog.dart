import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/provider/library_viewmodel.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';

class CustomDialogBox{
  static void showAlertDialog(BuildContext context, String title, String message,
      {@required double width, int actionID}) {
//actionID is used as flag to establish various route ways
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontSize: width / 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                      fontSize: width / 30, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                if (actionID != null && actionID == 0) {
/* Navigator.of(context).pushReplacementNamed(Constant.MY_ADS);*/
                  Navigator.of(context).pop(true);
                } else if (actionID != null && actionID == 1) {
                  //Navigator.of(context).pushReplacementNamed(Constant.MY_ADS);
                } else if (actionID != null && actionID == 3) {
                  Navigator.of(context).pop(true);
                }
              },
            ),
          ],
        );
      },
    );
  }


}


