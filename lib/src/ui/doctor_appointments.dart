import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/model/doctor_appointments_model.dart';
import 'package:flutter_taia_care/src/model/task_model.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class DoctorAppointments extends StatefulWidget {
  @override
  _DoctorAppointmentsState createState() => _DoctorAppointmentsState();
}

class _DoctorAppointmentsState extends State<DoctorAppointments> {
  double _width;
  double _height;
  List<DoctorModel> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list =[
      DoctorModel(doctorName: "Dr.Strange", time: "19.10.2019 8:00 Uhr", isNotification: false),
    ];

  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Arzttermine"),
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            listChats(),
            CustomButton(text: "ARZTTERMIN",
              onTap: () {
                Navigator.of(context).pushNamed(Constant.SETDOCTORAPPOINTMENTS);
              },
              isDelete: false,
              icon: Icons.add,
            )
          ],
        ),
      ),
    );
  }

  Widget listChats(){
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            return InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Constant.DOCTORAPPOINTMENTSDETAILS, arguments: DoctorModel(doctorName: list[index].doctorName,time: list[index].time) );
              },
              child: Container(
                height: _height/8,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(right:8.0, top: 8, bottom: 8, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              // !list[index].isSvg?Icon(list[index].icon,color: Styles.taiaGreen,):SvgPicture.asset(list[index].image, height: 50, width: 50,color: Styles.taiaGreen,allowDrawingOutsideViewBox: true,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(list[index].doctorName, style: TextStyle(fontSize: _width/25, fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text(list[index].time, maxLines: 5,),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.arrow_forward_ios, color: Colors.grey[400],size: _width/15,)
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ),
            );
          }
      ),
    );
  }
}
