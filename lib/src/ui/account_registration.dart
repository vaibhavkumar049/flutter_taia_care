import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/model/base_model.dart';
import 'package:flutter_taia_care/src/model/list_model.dart';
import 'package:flutter_taia_care/src/provider/register_viewmodel.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_checkbox.dart';
import 'package:flutter_taia_care/src/utils/base_view.dart';
import 'package:flutter_taia_care/src/utils/validator.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  double _height;
  double _width;
  int pageCount=1;
  double indicatorValue =0.1;
  Validator validator = Validator();
  bool visibility = false;
  GlobalKey<FormState> _userKey = GlobalKey();
  PageController _pageController = PageController();
  List<ListModel> _checkList= List();




  Map<String, bool> values = {
    'Afroamerikanisch': true,
    'Asiatisch': false,
    'Europäisch /Kaukasisch': false,
    'Hispanisch /Lateinamerikanisch': false,
    'Ureinwohner /Indianer': false,
    'Anderes': false,
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkList = [
      ListModel(
        text: "Afroamerikanisch",
        status: false,
      ),
      ListModel(
        text: "Asiatisch",
        status: false,
      ),
      ListModel(
        text: "Europäisch /Kaukasisch",
        status: false,
      ),
      ListModel(
        text: "Hispanisch /Lateinamerikanisch",
        status: false,
      ),
      ListModel(
        text: "Ureinwohner /Indianer",
        status: false,
      ),
      ListModel(
        text: "Anderes",
        status: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return BaseView<RegisterViewModel>(
      onModelReady: null,
      builder: (_,model, __)=>SafeArea(
        child: Scaffold(
          backgroundColor: Styles.whiteColor,
          resizeToAvoidBottomPadding: false,
          body: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Schritt ${model.pageCount} von 6"),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                       IconButton(icon: Icon( Icons.arrow_back, color: Styles.taiaGreen, size: _width/15,),
                            onPressed: () {
                          if(pageCount>1){
                            model.setPageCount(--pageCount);
                            model.setIndicatorValue(indicatorValue=indicatorValue-0.2);
                          } else {
                            model.clearModel();
                            Navigator.of(context).pop();
                          }
                            }),
                        Expanded(
                          flex: 1,
                          child: LinearProgressIndicator(
                            value: model.indicatorValue,
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  height: _height/1.7,
                  //color: Colors.red,
                  child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                   itemCount: 6,
                   itemBuilder: (_,index){
                      return pages(model);
                   },
                  ),
                ),
                _errorMessage(model)!=null?Flexible(child: Text(_errorMessage(model), style: TextStyle(color: Styles.strongRed),)):SizedBox(),
                CustomButton(
                  onTap: (){
                   // Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
                    model.setAutoValidate(true);
                    bool formValidation;
                    formValidation = model.pageCount==1? _userKey.currentState.validate():true;


                  if(model.pageCount ==1){
                    if(formValidation || model.firstPageValidation){
                      model.setFirstPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    }
                  } else if(model.pageCount==2){
                    if(_validateSecond(model)==null || model.secondPageValidation){
                      model.setSecondPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {
                     // CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte allen Aussagen zustimmen, um fortzufahren", width: _width);
                      print("Second Page Error");
                    }
                  } else if( model.pageCount==3){
                    if(_validateThird(model)==null || model.thirdPageValidation){
                      model.setThirdPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {
                      //CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte verbinde dich mit deinem Arzt. Wenn du keinen Einladungscode bekommen hast, dann markiere das Feld ", width: _width);
                      print("Third Page Error");
                    }
                  } else if(model.pageCount ==4){
                    if(_validateFourth(model)==null || model.fourthPagevalidation){
                      model.setFourthPagevalidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {
                     // CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe dein Geschlecht an", width: _width);
                      print("Fourth Page Error");
                    }
                  } else if(model.pageCount == 5){
                    if(model.fifthPageValidation){
                      model.setFifthPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {
                      //CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe deine Ethnizität an", width: _width);
                      print("Fifth Page Error");
                    }
                  } else if(model.pageCount ==6){
                    if(model.date !=null){
                      model.state = ViewState.Busy;
                      model.registerUser();
                      Navigator.of(context).pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
                    } else {
                      //CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte wähle dein Geburtsdatum aus", width: _width);
                      print("Sixt Page Error");
                    }
                  }
                  },
                  text: model.pageCount==6?"FERTIG":"WEITER",
                  isDelete: false,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pages(RegisterViewModel model){
    switch(pageCount){
      case 1: return firstPage(model);
      case 2: return secondPage(model);
      case 3: return thirdPage(model);
      case 4: return fourthPage(model);
      case 5: return fifthPage(model);
      case 6: return sixthPage(model);
    }
    return firstPage(model);
  }

  Widget  firstPage(RegisterViewModel model){
    return Form(
      key: _userKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Konto erstellen", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox( height: 30,),
        TextFormField(
          controller: model.emailController,
          autovalidate: model.autoValidate,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "E-Mail",
            hintStyle: TextStyle(fontSize: _width/20)
          ),
          validator: validator.validateEmail,
        ),
        SizedBox( height: 30,),
        TextFormField(
          controller: model.passController,
          validator: validator.validatePassword,
          autovalidate: model.autoValidate,
          obscureText: visibility?false:true,
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(fontSize: _width/20),
            suffixIcon: InkWell(
              onTap: (){
                setState(() {
                  visibility = !visibility;
                });

                print("visibility");
              },
              child: Icon(
                visibility? Icons.visibility:Icons.visibility_off,

              )

            ),
          ),

        ),
      ],
    ));
  }

  Widget secondPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Einverständnis", style: TextStyle(fontWeight: FontWeight.bold, fontSize:  _width/12),),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){
            model.setCheckbox1(!model.checkbox1);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      child:
                           Text.rich(
                        TextSpan(
                          text: "Ich akzeptiere die\n",
                          style: TextStyle(fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Datenschutzerklärung\t",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                            ),
                            TextSpan(
                              text: "und\n",
                            ),
                            TextSpan(
                              text: "Nutzungsbedingungen.",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      )
                         ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                        color: model.checkbox1?Styles.taiaGreen:Colors.transparent,
                        border: !model.checkbox1?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox1?Icon(Icons.check, color: Colors.white,):SizedBox(),
                  ),
                 /* Checkbox(
                    value: model.checkbox1,
                    onChanged: (value) {
                      model.setCheckbox1(!model.checkbox1);
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            model.setCheckbox2(!model.checkbox2);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      child:
                      Text(
                        "Ich stimme der Verarbeitung meiner persönlichen Gesundheitsdaten zu, um die Funktionen der taiaCare App nuzen zu können.",
                        style: TextStyle(fontSize: 18),
                      )
                         ),
                  SizedBox(width: 10,),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: model.checkbox2?Styles.taiaGreen:Colors.transparent,
                        border: !model.checkbox2?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox2?Icon(Icons.check, color: Colors.white,):SizedBox(),
                  ),
                 /* Checkbox(
                    value: model.checkbox2,
                    onChanged: (value) {
                      model.setCheckbox2(!model.checkbox2);
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            model.setCheckbox3(!model.checkbox3);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      child:  Text(
                        "Ich bin 16 Jahre oder älter",
                        style: TextStyle(fontSize: 18),
                      )
                         ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: model.checkbox3?Styles.taiaGreen:Colors.transparent,
                        border: !model.checkbox3?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox3?Icon(Icons.check, color: Colors.white,):SizedBox(),
                  ),
                 /* Checkbox(
                    value: model.checkbox3,
                    onChanged: (value) {
                      model.setCheckbox3(!model.checkbox3);
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            model.setCheckbox6(!model.checkbox6);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      child:  Text(
                        "Mir ist bewusst, dass wenn ich falsche Angaben mache ich auch ein falsches Ergebnis erhalten werde.",
                        style: TextStyle(fontSize: 18),
                      )
                         ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: model.checkbox6?Styles.taiaGreen:Colors.transparent,
                        border: !model.checkbox6?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox6?Icon(Icons.check, color: Colors.white,):SizedBox(),
                  ),
                 /* Checkbox(
                    value: model.checkbox3,
                    onChanged: (value) {
                      model.setCheckbox3(!model.checkbox3);
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
      /*  CustomCheckBox(
          isRichText: true,
          checkValue: model.checkbox1,
        ),
        CustomCheckBox(
          isRichText: false,
          checkValue: model.checkbox2,
          text: "Ich stimme der Verarbeitung meiner persönlichen Gesundheitsdaten zu, um die Funktionen der taiaCare App nuzen zu können.",
        ),
        CustomCheckBox(
          isRichText: false,
          checkValue: model.checkbox2,
          text: "Ich bin 16 Jahre oder älter",
        ),*/
      ],
    );
  }

  String _validateSecond(RegisterViewModel model){
    if(model.checkbox1 && model.checkbox2 && model.checkbox3 && model.checkbox6){
      return null;
    }
    return "Bitte allen Aussagen zustimmen, um fortzufahren";
  }
  
  Widget thirdPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Mit Arzt verbinden", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){
              model.setCheckbox4(!model.checkbox4);
              model.setCheckbox5(false);

          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: model.codeController,
                    decoration: InputDecoration(
                      hintText: "Einladungscode",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                 SizedBox(height: 5,),
                 /* Text("Einladungscode",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  Container(
                    height: 1,
                    width: _width,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          child: Text.rich(
                            TextSpan(
                              text: "Ich stimme zu, dass mein Arzt Zugriff auf meine Daten hat. Siehe\t",
                              style: TextStyle(fontSize: _width/25),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Datenschutzrichtlinie\t",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ) ),
                         /* Text(
                            "Ich stimme zu, dass mein Arzt Zugriff auf meine Daten hat. Siehe Datenschutzrichtlinie.",
                            style: TextStyle(fontSize: _width/25),
                          )),*/
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: model.checkbox4?Styles.taiaGreen:Colors.transparent,
                            border: !model.checkbox4?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: model.checkbox4?Icon(Icons.check, color: Colors.white,):SizedBox(),
                      ),
                     /* Checkbox(
                        value: model.checkbox4,
                        onChanged: (value) {
                          model.setCheckbox4(!model.checkbox4);
                        },
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
              model.setCheckbox5(!model.checkbox5);
              model.setCheckbox4(false);
              model.codeController.clear();

          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      child: Text(
                        "Ich habe keinen Einladungscode",
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: model.checkbox5?Styles.taiaGreen:Colors.transparent,
                        border: !model.checkbox5?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: model.checkbox5?Icon(Icons.check, color: Colors.white,):SizedBox(),
                  ),
                  /*Checkbox(
                    value: model.checkbox5,
                    onChanged: (value) {
                      model.setCheckbox5(!model.checkbox5);
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
     /*   CustomCheckBox(
          isRichText: false,
          checkValue: model.checkbox4,
          text: "Ich stimme zu, dass mein Arzt Zugriff auf meine Daten hat. Siehe Datenschutzrichtlinie.",
          isThirdPage: true,
          thirdPageText: "Einladungscode",
        ),
        CustomCheckBox(
          isRichText: false,
          checkValue: model.checkbox5,
          text: "Ich habe keinen Einladungscode",
        ),*/
      ],
    );
    
  }

  String _validateThird(RegisterViewModel model) {
    if(model.checkbox5){
      return null;
    } else if (model.codeController.text.length>0 && !model.checkbox4){
      return "Bitte bestätige, dass du zustimmst Daten mit deinem Arzt zu teilen";
    } else if(model.codeController.text.length<1 && model.checkbox4){
      return "Bitte gebe einen gültigen Einladungscode ein";
    } else if(model.codeController.text.length>0 && model.checkbox4){
      return null;
    }
    return "Bitte verbinde dich mit deinem Arzt. Wenn du keinen Einladungscode bekommen hast, dann markiere das Feld “Ich habe keinen Einladungscode";
  }
  
  Widget fourthPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Geschlecht", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  // model.setIsTapped(!model.isTapped);
                  model.setRadioButton1(!model.radioButton1);
                  model.setRadioButton2(false);
                  model.setRadioButton3(false);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.mars, color: Styles.taiaGreen,),
                            SizedBox(width: 5,),
                            Text("Weiblich", style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: model.radioButton1 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !model.radioButton1 ? Colors
                                  .black : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                          child:  model.radioButton1?Icon(Icons.check, color: Colors.white,):SizedBox(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // model.setIsTapped(!model.isTapped);
                  model.setRadioButton2(!model.radioButton2);
                  model.setRadioButton1(false);
                  model.setRadioButton3(false);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.venus, color: Styles.taiaGreen,),
                            SizedBox(width: 5,),
                            Text("Männlich", style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: model.radioButton2 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !model.radioButton2 ? Colors
                                  .black : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                          child:  model.radioButton2?Icon(Icons.check, color: Colors.white,):SizedBox(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // model.setIsTapped(!model.isTapped);
                  model.setRadioButton3(!model.radioButton3);
                  model.setRadioButton1(false);
                  model.setRadioButton2(false);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.transgender, color: Styles.taiaGreen,),
                            SizedBox(width: 5,),
                            Text("Anderes", style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: model.radioButton3? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !model.radioButton3 ? Colors
                                  .black : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                          child:  model.radioButton3?Icon(Icons.check, color: Colors.white,):SizedBox(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
        ]

        )
      ],
    );
  }

  String _validateFourth(RegisterViewModel model){
    if(model.radioButton1 || model.radioButton2 || model.radioButton3){
      return null;
    }
    return "Bitte gebe dein Geschlecht an";
  }

  Widget fifthPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Ethnizität", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
              itemCount: _checkList.length,
              itemBuilder: (_,index){
                return Card(
                  child: CheckboxListTile(
                    title: Text(_checkList[index].text),
                    value: _checkList[index].status,
                    onChanged: (value){
                      model.setFifthPageValidation(!model.fifthPageValidation);
                      setState(() {
                        _checkList[index].status = value;
                      });

                    },
                  ),
                );
              }
          ),
        )
      ],
    );
  }

  Widget sixthPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Geburtsdatum", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){
            DatePicker.showDatePicker(context,
                //showTitleActions: true,
                showTitleActions: true,
                minTime: DateTime(2000, 3, 5),
                maxTime: DateTime(2030, 6, 7),
                onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                  model.setDate(date.toIso8601String());
                }, currentTime: DateTime.now(), locale: LocaleType.de);
          },
          child: Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(15),
              width: _width,
              alignment: Alignment.center,
              child: Text(model.date==null?"Datum auswählen":model.date, style: TextStyle(fontSize: 20),),
            ),
          ),
        )
      ],
    );
  }

  String _errorMessage(RegisterViewModel model){
    if(model.pageCount==1){
      return null;
    } else if(model.pageCount==2){
      return _validateSecond(model);
    }else if(model.pageCount==3){
      return _validateThird(model);
    } else if(model.pageCount==4){
      return _validateFourth(model);
    } else if(model.pageCount==5 && !model.fifthPageValidation){
      return "Bitte gebe deine Ethnizität an";
    } else if(model.pageCount==6 && model.date==null){
      return "Bitte wähle dein Geburtsdatum aus";
    }
    return null;
  }





}


