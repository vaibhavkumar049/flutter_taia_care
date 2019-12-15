import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/doctor_appointments_model.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class DoctorAppointmentDetails extends StatefulWidget {
  @override
  _DoctorAppointmentDetailsState createState() => _DoctorAppointmentDetailsState();
}

class _DoctorAppointmentDetailsState extends State<DoctorAppointmentDetails> {
  double _width;
  double _height;
  bool notificationSwitch=false;
  DoctorModel _appointmentsModel;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _appointmentsModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: _appointmentsModel.doctorName),
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
                  Text(_appointmentsModel.doctorName, style: TextStyle(fontWeight: FontWeight.w500),),
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
                      Text(_appointmentsModel.time, style: TextStyle(fontWeight: FontWeight.w500),),
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
          SizedBox(height: 10,),
          CustomButton(
            onTap: (){
              //Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
            },
            text: "LÖSCHEN",
            icon: Icons.delete,
            isDelete: true,
          ),
        ],
      ),
    );
  }
}
