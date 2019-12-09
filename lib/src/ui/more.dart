import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.brown,
      body: Container(
        height: _height,
        width: _width,
        color: Styles.whiteColor,
        child: Stack(
          children: <Widget>[
            Container(
              height: 100,
              color: Styles.taiaGreen,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _body(){
    return Column(
      children: <Widget>[
        cardItems(text: "Dein Profil" , icon:FontAwesomeIcons.addressBook,onTap: (){
          Navigator.of(context).pushNamed(Constant.YOURPROFILE);
        }),
        cardItems(text: "Dein Arzt", icon: FontAwesomeIcons.stethoscope, onTap: (){
          Navigator.of(context).pushNamed(Constant.YOURDOCTOR);
        }),
        cardItems(text: "Einstellungen", icon: FontAwesomeIcons.cog, onTap: (){
          Navigator.of(context).pushNamed(Constant.SETTINGS);
        }),
        cardItems(text: "Feedback", icon: FontAwesomeIcons.star, onTap: (){
          Navigator.of(context).pushNamed(Constant.FEEDBACK);
        }),
        cardItems(text: "Über Taia" ,icon: FontAwesomeIcons.infoCircle, onTap: (){
          Navigator.of(context).pushNamed(Constant.ABOUT);
        }),
      ],
    );
  }

  Widget cardItems({String text, IconData icon, Function onTap}){
    return  InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon, color: Styles.taiaGreen,),
                  SizedBox(width: 30,),
                  Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),

              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
