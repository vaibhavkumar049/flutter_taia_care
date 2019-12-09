import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class GeneralInformation extends StatefulWidget {
  @override
  _GeneralInformationState createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  double _width;
  double _height;
  TextEditingController _nameController = TextEditingController();
  String profileDate;
  String gender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = "Felix";
    profileDate = "19.01.1990";
    gender = "Weiblich";
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Allgemeine Angaben"),
      body: SafeArea(
          child: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _topPart(),
               CustomButton(text: "SPEICHERN",onTap: (){Navigator.of(context).pop();},isDelete: false,)
              ],
            ),
          )
      ),
    );
  }

  Widget _topPart() {
    return Column(
      children: <Widget>[
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: "Name",
          ),
        ) ,
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2000, 3, 5),
                maxTime: DateTime(2030, 6, 7),
                onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                  setState(() {
                    profileDate=date.toIso8601String();
                  });

                }, currentTime: DateTime.now(), locale: LocaleType.de);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Geburtsdatum",style: TextStyle(color: Styles.greyTextColor),),
              SizedBox(height: 5,),
              Text(profileDate, style: TextStyle(fontSize: _width/20),),
              SizedBox(height: 5,),
              Container(width: _width,height: 1,color: Colors.black,)
            ],
          ),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: (){

          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Geschlecht",style: TextStyle(color: Styles.greyTextColor),),
              SizedBox(height: 5,),
              Text(gender, style: TextStyle(fontSize: _width/20),),
              SizedBox(height: 5,),
              Container(width: _width,height: 1,color: Colors.black,)
            ],
          ),
        )
      ],
    );
  }

}
