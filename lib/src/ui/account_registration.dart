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
import 'package:intl/intl.dart';

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
  List<String> ethnicityList=List();
  String format = "yyyy:MM:dd";



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
         // resizeToAvoidBottomPadding: false,
          body: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(icon: Icon( Icons.arrow_back, color: Styles.taiaGreen,),
                              alignment: Alignment.center,
                              iconSize: _width/10,
                              onPressed: () {
                                if(pageCount>1){
                                  model.setPageCount(--pageCount);
                                  model.setIndicatorValue(indicatorValue=indicatorValue-0.2);
                                } else {
                                  model.clearModel();
                                  Navigator.of(context).pop();
                                }
                              }),
                          SizedBox(width: 20,),
                          Text(_header(model), style: TextStyle(fontSize:  30, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      buildIndicators(model),

                    /*  LinearProgressIndicator(
                        value: model.indicatorValue,
                        backgroundColor: Colors.grey[200],
                      ),*/
                    ],
                  ),

                  Container(
                    height: _height/1.7,
                    //color: Colors.red,
                    margin: EdgeInsets.only(top: 40),
                    child: PageView.builder(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                     itemCount: 6,
                     itemBuilder: (_,index){
                        return pages(model);
                     },
                    ),
                  ),
                  SizedBox(height: _height/12,),
                 model.autoValidate? _errorMessage(model)!=null?Flexible(child: Text(_errorMessage(model), style: TextStyle(color: Styles.strongRed),)):SizedBox():SizedBox(),
                  CustomButton(
                    onTap: (){
                     // Navigator.of(context).pushReplacementNamed(Constant.REGISTER);

                      bool formValidation;
                      formValidation = model.pageCount==1? _userKey.currentState.validate():true;


                    if(model.pageCount ==1){
                      model.setAutoValidate(true);
                      if(formValidation || model.firstPageValidation){
                        model.setFirstPageValidation(true);
                        print("Next");
                        model.pageCount<=5?model.setPageCount(++pageCount):null;
                        model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                        print("Pagecount value: ${model.pageCount}");
                        model.setAutoValidate(false);
                      }
                    } else if(model.pageCount==2){
                      model.setAutoValidate(true);
                      if(_validateSecond(model)==null || model.secondPageValidation){
                        model.setSecondPageValidation(true);
                        print("Next");
                        model.pageCount<=5?model.setPageCount(++pageCount):null;
                        model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                        print("Pagecount value: ${model.pageCount}");
                        model.setAutoValidate(false);
                      } else {
                       // CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte allen Aussagen zustimmen, um fortzufahren", width: _width);
                        print("Second Page Error");
                      }
                    } else if( model.pageCount==3){
                      model.setAutoValidate(true);
                      if(_validateThird(model)==null || model.thirdPageValidation){
                        model.setThirdPageValidation(true);
                        print("Next");
                        model.pageCount<=5?model.setPageCount(++pageCount):null;
                        model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                        print("Pagecount value: ${model.pageCount}");
                        model.setAutoValidate(false);
                      } else {
                        //CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte verbinde dich mit deinem Arzt. Wenn du keinen Einladungscode bekommen hast, dann markiere das Feld ", width: _width);
                        print("Third Page Error");
                      }
                    } else if(model.pageCount ==4){
                      model.setAutoValidate(true);
                      if(_validateFourth(model)==null){
                        model.setFourthPagevalidation(true);
                        print("Next");
                        model.pageCount<=5?model.setPageCount(++pageCount):null;
                        model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                        print("Pagecount value: ${model.pageCount}");
                        model.setAutoValidate(false);
                      } else {
                       // CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe dein Geschlecht an", width: _width);
                        print("Fourth Page Error");
                      }
                    } else if(model.pageCount == 5){
                      model.setAutoValidate(true);
                      if(_validateFifth(model)==null){
                        model.setFifthPageValidation(true);
                        print("Next");
                        model.pageCount<=5?model.setPageCount(++pageCount):null;
                        model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                        print("Pagecount value: ${model.pageCount}");
                        model.setAutoValidate(false);
                      } else {
                        //CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe deine Ethnizität an", width: _width);
                        print("Fifth Page Error");
                      }
                    } else if(model.pageCount ==6 && model.sixthPageValidation){
                      print('Sizth page');
                        model.state = ViewState.Busy;
                        model.registerUser(context);
                     //Navigator.of(context).pushReplacementNamed(Constant.DASHBOARD, arguments: 0);

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
      ),
    );
  }

  Widget buildIndicators(RegisterViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 6,
            //width: _width / 10,
            decoration: BoxDecoration(
                color: model.pageCount == 1 || model.firstPageValidation
                    ? Styles.taiaGreen
                    : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 6,
            //width: _width / 10,
            decoration: BoxDecoration(
                color: model.pageCount == 2 || model.secondPageValidation
                    ? Styles.taiaGreen
                    : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 6,
            //width: _width / 10,
            decoration: BoxDecoration(
                color: model.pageCount == 3 || model.thirdPageValidation
                    ? Styles.taiaGreen
                    : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 6,
            //width: _width / 10,
            decoration: BoxDecoration(
                color: model.pageCount == 4 || model.fourthPagevalidation
                    ? Styles.taiaGreen
                    : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 6,
            //width: _width / 10,
            decoration: BoxDecoration(
                color: model.pageCount == 5 || model.fifthPageValidation
                    ? Styles.taiaGreen
                    : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 6,
            //width: _width / 10,
            decoration: BoxDecoration(
                color: model.pageCount == 6
                    ? Styles.taiaGreen
                    : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ],
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
       /* Text("Konto erstellen", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox( height: 30,),*/
        TextFormField(
          controller: model.emailController,
          autovalidate: model.autoValidate,
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          focusNode: model.emailFocus,
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
              hintText: "Passwort",
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       /* Text("Einverständnis", style: TextStyle(fontWeight: FontWeight.bold, fontSize:  _width/12),),
        SizedBox(height: 10,),*/
        InkWell(
          onTap: (){
            print("checking");
            model.setCheckbox1(!model.checkbox1);
          },
          child: Card(
            elevation: 5,
            color: model.checkbox1?Styles.taiaGreenLight:Styles.chatBubbleGrey,
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
                        color: model.checkbox1?Colors.white:Colors.white,
                        border: !model.checkbox1?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox1?Icon(Icons.check, color: Colors.black,):SizedBox(),
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
            elevation: 5,
            color: model.checkbox2?Styles.taiaGreenLight:Styles.chatBubbleGrey,
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
                        color: model.checkbox2?Colors.white:Colors.white,
                        border: !model.checkbox2?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox2?Icon(Icons.check, color: Colors.black,):SizedBox(),
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
            elevation: 5,
            color: model.checkbox3?Styles.taiaGreenLight:Styles.chatBubbleGrey,
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
                        color: model.checkbox3?Colors.white:Colors.white,
                        border: !model.checkbox3?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox3?Icon(Icons.check, color: Colors.black,):SizedBox(),
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
      /*  InkWell(
          onTap: (){
            model.setCheckbox6(!model.checkbox6);
          },
          child: Card(
            color: Styles.chatBubbleGrey,
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
                ],
              ),
            ),
          ),
        ),*/
      ],
    );
  }

  String _validateSecond(RegisterViewModel model){
    if(model.checkbox1 && model.checkbox2 && model.checkbox3){
      return null;
    }
    return "Bitte allen Aussagen zustimmen, um fortzufahren";
  }
  
  Widget thirdPage(RegisterViewModel model){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      /*  Text("Mit Arzt verbinden", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(height: 10,),*/
        Text("Taia möchte dir helfen", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text("Je korrekter deine Eingaben sind, desto besser kann Taia dir helfen.Falsche Eingaben können zu falschen Hinweisen und Empfehlungen.", style: TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){
              model.setCheckbox4(!model.checkbox4);

          },
          child: Card(
            color: model.checkbox4?Styles.taiaGreenLight:Styles.chatBubbleGrey,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      child: Text("Ich stimme zu",
                          style: TextStyle(fontSize: _width/25),
                      ) ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: model.checkbox4?Colors.white:Colors.white,
                        border: !model.checkbox4?Border.all(color: Styles.boxesNarrowsGrey):Border(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: model.checkbox4?Icon(Icons.check, color: Colors.black,):SizedBox(),
                  ),
                 /* Checkbox(
                    value: model.checkbox4,
                    onChanged: (value) {
                      model.setCheckbox4(!model.checkbox4);
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ],
    );
    
  }

  String _validateThird(RegisterViewModel model) {
    if(model.checkbox4){
      return null;
    }
    return "Bitte allen Aussagen zustimmen, um fortzufahren";
  }
  
  Widget fourthPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        Text("Geschlecht", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        Text("Hast du einen Einladungscode?", style: TextStyle(fontSize: 20),),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            Expanded(
              child: Material(
                elevation: 3,
                child: InkWell(
                  onTap: (){
                    model.setCheckbox5(!model.checkbox5);
                    model.setCheckbox6(false);
                  },
                  child: Container(
                    height: _height/8,
                    decoration: BoxDecoration(
                      color: model.checkbox5?Styles.taiaGreenLight:Styles.transparent,
                      border: Border.all(
                        color: Styles.boxesNarrowsGrey
                      )
                    ),
                    child: Center(child: Text("JA", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 30,),
            Expanded(
              child: Material(
                elevation: 3,
                child: InkWell(
                  onTap: (){
                    model.setCheckbox6(!model.checkbox6);
                    model.setCheckbox5(false);
                  },
                  child: Container(
                    height: _height/8,
                    decoration: BoxDecoration(
                        color: model.checkbox6?Styles.taiaGreenLight:Styles.transparent,
                        border: Border.all(
                            color: Styles.boxesNarrowsGrey
                        )
                    ),
                    child: Center(child: Text("NEIN",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
                  ),
                ),
              ),
            )
          ],
        ),
        model.checkbox5?Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Styles.taiaGreen
                )
              ),
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                controller: model.codeController,
                focusNode: model.codeFocus,
                autofocus: true,
                decoration: InputDecoration(
                  border: model.codeFocus!=null? InputBorder.none:null,
                  labelText: "Einladungscode"
                ),
              ),
            )
          ],
        ):SizedBox()
      ],
    );
  }

  String _validateFourth(RegisterViewModel model){
  print("Code value is:${model.codeController.text}");
    if(model.checkbox6){
      print("checkbox 6");
      return null;
    } else if(model.checkbox5 && model.codeController.text==""){
      print("Code is empty");
      return "Bitte gültigen Einladungscode angeben";
    } else if(!model.checkbox5 && !model.checkbox6){
      return "Bitte verbinde dich mit deinem Arzt. Wenn du keinen Einladungscode bekommen hast, dann markiere das Feld “Ich habe keinen Einladungscode";
    }
    return null;
  }

  Widget fifthPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      /*  Text("Ethnizität", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),*/
        Column(
            children: <Widget>[
              Text("Dein Geschlecht", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
              InkWell(
                onTap: () {
                  // model.setIsTapped(!model.isTapped);
                  model.setRadioButton1(!model.radioButton1);
                  model.setGender("Weiblich");
                  model.setRadioButton2(false);
                  model.setRadioButton3(false);
                },
                child: Card(
                  shape: Border.all(color: Styles.boxesNarrowsGrey),
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
                  model.setGender("Männlich");
                  model.setRadioButton1(false);
                  model.setRadioButton3(false);
                },
                child: Card(
                  shape: Border.all(color: Styles.boxesNarrowsGrey),
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
                  model.setGender("Anderes");
                  model.setRadioButton1(false);
                  model.setRadioButton2(false);
                },
                child: Card(
                  shape: Border.all(color: Styles.boxesNarrowsGrey),
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

        ),
        //SizedBox(height: 30,),
        Column(
          children: <Widget>[
            Text("Dein Geschlecht", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
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
                      model.setDate(DateFormat(format).format(date));
                    }, currentTime: DateTime.now(), locale: LocaleType.de);
              },
              child: Card(
                elevation: 2,
                shape: Border.all(color: Styles.boxesNarrowsGrey),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: _width,
                  alignment: Alignment.center,
                  child: Text(model.date==null?"Datum auswählen":model.date, style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  String _validateFifth(RegisterViewModel model){
     if(!model.radioButton1 && !model.radioButton2 && !model.radioButton3){
       return "Bitte gebe dein Geschlecht an";
    } else if(model.date ==null){
       return "Bitte wähle dein Geburtsdatum aus";
     }

    return null;
  }

  Widget sixthPage(RegisterViewModel model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      /*  Text("Geburtsdatum", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),*/
        model.isAnderes?
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: Styles.taiaGreen
              )
          ),
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            controller: model.codeController,
            focusNode: model.codeFocus,
            autofocus: true,
            decoration: InputDecoration(
                border: model.codeFocus!=null? InputBorder.none:null,
                labelText: "Anderes"
            ),
          ),
        )
            :Expanded(
          child: ListView.builder(
              itemCount: _checkList.length,
              itemBuilder: (_,index){
                return Card(
                  color: Styles.chatBubbleGrey,
                  child: CheckboxListTile(
                    title: Text(_checkList[index].text),
                    value: _checkList[index].status,
                    onChanged: (value){
                      setState(() {
                        _checkList[index].status = value;
                      });
                      model.setSixthPageValidation(_checkList[index].status);
                      if(_checkList[index].text=="Anderes"){
                        model.setIsAnderes(true);
                      }

                      ethnicityList.add(_checkList[index].text);
                      model.setEthnicityList(ethnicityList);

                      // print("Ethnicity List: $ethnicityList");

                    },
                  ),
                );
              }
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
    } else if(model.pageCount==5 && _validateFifth(model)!=null){
      return _validateFifth(model);
    }
    else if(model.pageCount==6 && !model.sixthPageValidation){
      print("Sixth page error");
      return "Bitte wähle dein Geburtsdatum aus";
    }
    return null;
  }

  String _header(RegisterViewModel model){
    if(model.pageCount==1){
      return "Konto erstellen";
    } else if (model.pageCount==2){
      return "Einverständnis";
    } else if (model.pageCount==3){
      return "Nutzungshinweis";
      //return "Mit Arzt verbinden";
    } else if (model.pageCount==4){
      return "Mit Arzt verbinden";
    } else if(model.pageCount==5){
      return "Über mich";
    } else if (model.pageCount ==6){
      return "Ethnizität";
    }
    return null;


  }





}


