import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';


class ConnectDoctor extends StatefulWidget {
  @override
  _ConnectDoctorState createState() => _ConnectDoctorState();
}

class _ConnectDoctorState extends State<ConnectDoctor> {
  double _width;
  double _height;
  TextEditingController _controller = TextEditingController();
  bool _checkbox=false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Mit Arzt verbinden"),
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Trage den Verbindungs-Code, den du von deinem Arzt bekommen hast hier ein",style: TextStyle(fontSize: _width/25,color: Styles.greyTextColor)),
            SizedBox(height: 20,),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "Verbindungs-Code",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: _width/20)
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(child: Text("Ich stimme zu, dass mein Arzt Zugriff auf meine Daten hat.Siehe Datenschutzrichtlinie.")),
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
                  CustomDialogBox.showAlertDialog(context, "Alert!", "Stimme der Datenverarbeitung zu", width: _width);
                }
              },
              isDelete: false,
            )

          ],
        ),
      ),
    );
  }
}
