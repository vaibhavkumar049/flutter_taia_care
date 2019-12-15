import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/doctor_appointments_model.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';

class MessagesDoctor extends StatefulWidget {
  @override
  _MessagesDoctorState createState() => _MessagesDoctorState();
}

class _MessagesDoctorState extends State<MessagesDoctor> {
  double _width;
  double _height;
  List<DoctorModel> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      DoctorModel(doctorName: "Dr.Strange", time: "05.11.2019", information: ["Informationspaket Methotrexat","Diagnose"]),
      DoctorModel(doctorName: "Dr.Strange", time: "05.11.2019", information: ["Informationspaket Methotrexat","Diagnose"]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Nachrichten"),
      body: Container(
        height: _height,
        width: _width,
        child: listChats(),
      ),
    );
  }

  Widget listChats(){
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_,index){
          return InkWell(
            onTap: (){

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: _height/5.5,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(list[index].doctorName, style: TextStyle(fontWeight: FontWeight.w500),),
                      Text(list[index].time, style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 15,),
                      Row(
                        children: <Widget>[
                          CircleAvatar(radius: 3,backgroundColor: Colors.black,),
                          SizedBox(width: 10,),
                          Text(list[index].information[0])
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(radius: 3,backgroundColor: Colors.black,),
                          SizedBox(width: 10,),
                          Text(list[index].information[1])
                        ],
                      ),
                    ],
                  )
                ),
                Container(height: 4, width: _width, color: Colors.grey[300],),
              ],
            ),
          );
        }
    );
  }
}
