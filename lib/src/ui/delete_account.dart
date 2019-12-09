import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeleteAccount extends StatefulWidget {
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  double _width;
  double _height;
  TextEditingController _controller = TextEditingController();
  bool _checkbox=false;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Account löschen"),
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Möchtest du deinen Account wirklich löschen? Diese Aktion kann nicht rückgängig gemacht werden",style: TextStyle(fontSize: _width/25,color: Styles.greyTextColor)),
            SizedBox(height: 20,),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Passwort",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: _width/20)
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(child: Text("Ich möchte meinen Account löschen")),
                Checkbox(
                    value: _checkbox,
                    onChanged: (value){
                      setState(() {
                        _checkbox = value;
                      });
                    }
                )
              ],
            ),
            SizedBox(height: 20,),
            CustomButton(text: "ACCOUNT LÖSCHEN",
              onTap: () {
                if(_checkbox){

                } else {
                  CustomDialogBox.showAlertDialog(context, "Alert!", "Bestätige, dass du deinen Account löschen möchtest indem du die Checkbox bestätigst.", width: _width);
                }
              },
              isDelete: true,
              icon: FontAwesomeIcons.eraser,
            )

          ],
        ),
      ),
    );
  }
}
