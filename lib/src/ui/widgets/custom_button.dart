import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';

class CustomButton extends StatelessWidget {
   double _height;
   double _width;
 final Function onTap;
  final String text;
  final IconData icon;
  final bool isDelete;

  CustomButton({this.onTap, this.text, this.icon, this.isDelete});

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width,
      child: RaisedButton(
        onPressed: onTap,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        color: isDelete && isDelete!=null?Styles.lightRed:Styles.taiaGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon!=null? Icon(icon, color: Colors.white,):SizedBox(),
            icon!=null?SizedBox(width: 10,):SizedBox(),
            Text(text, style: TextStyle(color: Styles.whiteColor, fontSize: _width/20),),
          ],
        ),
      ),
    );
  }
}
