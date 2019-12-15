import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class Medication extends StatefulWidget {
  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  double _width;
  double _height;
  List<MedicationModel> _medicationList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _medicationList = [
      MedicationModel(title: "Methotrexat", subtitle: "15mg alle zwei Wochen", getNotified: false),
    ];
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Medikamente"),
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            _builtMedicineList(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(Constant.ADDMEDICATION);
                },
                text: "MEDIKAMENT",
                icon: Icons.add,
                isDelete: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builtMedicineList(){
    return ListView.builder(
      itemCount: _medicationList.length,
        shrinkWrap: true,
        itemBuilder: (_,index){
      return InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(Constant.MEDICINEDETAILS, arguments: _medicationList[index].title);
        },
        child: SizedBox(
          height: _height/10,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_medicationList[index].title, style: TextStyle(fontWeight: FontWeight.w500),),
                      Text(_medicationList[index].subtitle, style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(icon: Icon(_medicationList[index].getNotified?Icons.notifications:Icons.notifications_off, color: Colors.grey,), onPressed: () {
                        setState(() {
                          _medicationList[index].getNotified = !_medicationList[index].getNotified;
                        });
                      }),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,)
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class MedicationModel{
  String title;
  String subtitle;
  bool getNotified;

  MedicationModel({this.title, this.subtitle, this.getNotified});

}
