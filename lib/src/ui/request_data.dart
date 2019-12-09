import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:flutter_taia_care/src/utils/validator.dart';

class RequestData extends StatefulWidget {
  @override
  _RequestDataState createState() => _RequestDataState();
}

class _RequestDataState extends State<RequestData> {
  double _width;
  double _height;
  GlobalKey<FormState> _userKey = GlobalKey();
  Validator validator = Validator();
  bool isAutoValidate=false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Daten anfordern"),
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(20),
        child: Form(
          key: _userKey,
          child: Column(
            children: <Widget>[
              Text("E-Mail Adresse, an die du alle deine Daten senden möchtest",style: TextStyle(fontSize: _width/25, color: Styles.greyTextColor)),
              SizedBox(height: 10,),
              TextFormField(
                autovalidate: isAutoValidate,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "E-Mail",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: _width/20)
                ),
                validator: validator.validateEmail,
              ),
              SizedBox(height: 20,),
              Text("Gebe dein Passwort ein, um zu bestätigen, dass du es bist",style: TextStyle(fontSize: _width/25,color: Styles.greyTextColor)),
              SizedBox(height: 10,),
              TextFormField(
                autovalidate: isAutoValidate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Passwort",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: _width/20)
                ),
                validator: validator.validatePassword,
              ),
              SizedBox(height: 30,),
              CustomButton(text: "DATEN SENDEN",
                onTap: () {

                },
                isDelete: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
