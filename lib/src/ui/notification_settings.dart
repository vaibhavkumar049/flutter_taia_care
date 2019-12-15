import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  double _width;
  double _height;
  bool medicationSwitch=true;
  bool chatSwitch=true;
  bool radio1=false;
  bool radio2=false;
  bool radio3=false;
  bool radio4=false;
  bool radio5=false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Benachrichtigungen"),
      body: Container(
        height: _height,
        width: _width,  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Medikamente'),
                  Switch(
                      value: medicationSwitch,
                      onChanged: (value){
                        setState(() {
                          medicationSwitch=!medicationSwitch;
                        });
                        if(!value){
                          CustomDialogBox.showAlertDialog(context, "Confirm", "Du bist dabei alle Medikamentenerinnerungen auszuschalten. Wenn du nur einzelne Medikamentenerinnerungen ausschalten möchtest ändere deine Einstellungen unter Profil > Medikamente > entsprechendes Medikament", width: _width);
                        }
                      }
                  )
                ],
              ),
            ),
            Container(height: 4, width: _width, color: Colors.grey[300],),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(child: Text('Tägliche Chat Erinnerungen')),
                  Switch(
                      value: chatSwitch,
                      onChanged: (value){
                        setState(() {
                          chatSwitch=!chatSwitch;
                        });
                      }
                  )
                ],
              ),
            ),
            Container(height: 1, width: _width, color: Colors.grey[300],),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Wann möchtest du erinnert werden?"),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        radio1=!radio1;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Morgens", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 15,
                          height: _height / 25,
                          decoration: BoxDecoration(
                              color: radio1 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !radio1 ? Colors
                                  .grey[400] : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        radio2=!radio2;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Mittags", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 15,
                          height: _height / 25,
                          decoration: BoxDecoration(
                              color: radio2 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !radio2 ? Colors
                                  .grey[400] : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        radio3=!radio3;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Abends", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 15,
                          height: _height / 25,
                          decoration: BoxDecoration(
                              color: radio3 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !radio3 ? Colors
                                  .grey[400] : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        radio4=!radio4;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Nachts", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 15,
                          height: _height / 25,
                          decoration: BoxDecoration(
                              color: radio4 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !radio4 ? Colors
                                  .grey[400] : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        radio5=!radio5;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Unterschiedlich", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 15,
                          height: _height / 25,
                          decoration: BoxDecoration(
                              color: radio5 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !radio5 ? Colors
                                  .grey[400] : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
