import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class SetDoctorAppointments extends StatefulWidget {
  @override
  _SetDoctorAppointmentsState createState() => _SetDoctorAppointmentsState();
}

class _SetDoctorAppointmentsState extends State<SetDoctorAppointments> {
  double _width;
  double _height;
  bool notificationSwitch=false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Arzttermin hinzufügen"),
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Arztname'),
                  Text("Eintragen"),
                ],
              ),
            ),
            Container(height: 4, width: _width, color: Colors.grey[300],),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Zeit'),
                  Row(
                    children: <Widget>[
                      Text("Startdatum & -zeit",),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,)
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 1, width: _width, color: Colors.grey[300],),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Erinnerung'),
                  Switch(
                      value: notificationSwitch,
                      onChanged: (value){
                        setState(() {
                          notificationSwitch=!notificationSwitch;
                        });
                      }
                  )
                ],
              ),
            ),
            Container(height: 4, width: _width, color: Colors.grey[300],),
            _buildButtons()
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          CustomButton(
            onTap: (){
              //Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
            },
            text: "SPEICHERN",
            isDelete: false,
          ),
        ],
      ),
    );
  }
}
