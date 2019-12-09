import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/provider/register_viewmodel.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_checkbox.dart';
import 'package:flutter_taia_care/src/utils/base_view.dart';
import 'package:flutter_taia_care/src/utils/validator.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  List<ListModel> _checkList = [
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

  Map<String, bool> values = {
    'Afroamerikanisch': true,
    'Asiatisch': false,
    'Europäisch /Kaukasisch': false,
    'Hispanisch /Lateinamerikanisch': false,
    'Ureinwohner /Indianer': false,
    'Anderes': false,
  };


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
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Schritt ${model.pageCount} von 6"),
                    SizedBox(height: 10,),
                    LinearProgressIndicator(
                      value: model.indicatorValue,
                      backgroundColor: Colors.grey[200],
                    ),
                  ],
                ),

                Container(
                  height: _height/2,
                  child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                   itemCount: 6,
                   itemBuilder: (_,index){
                      return pages(model);
                   },
                  ),
                ),

                CustomButton(
                  onTap: (){
                   // Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
                    model.setAutoValidate(true);
                    bool formValidation;
                    formValidation = model.pageCount==1? _userKey.currentState.validate():true;

                  /*  if(formValidation && model.pageCount==1 || model.firstPageValidation){
                      model.setFirstPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                      if(_validateSecond(model) && model.pageCount ==2 || model.secondPageValidation){
                        model.setSecondPageValidation(true);
                        print("Next");
                        model.pageCount<=5?model.setPageCount(++pageCount):null;
                        model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                        print("Pagecount value: ${model.pageCount}");
                        if(_validateThird(model) && model.pageCount ==3 || model.thirdPageValidation){
                          print("Next");
                          model.pageCount<=5?model.setPageCount(++pageCount):null;
                          model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                          print("Pagecount value: ${model.pageCount}");
                        } else{
                          print("Third page error");
                        }
                      } else {
                        print('Second page error');
                      }
                    } else {
                      print('First page error');
                    }*/

                  if(model.pageCount ==1){
                    if(formValidation || model.firstPageValidation){
                      model.setFirstPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {
                      CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe eine gültige E-Mail Adresse und ein gültiges Passwort ein", width: _width);
                      print("First page error");
                    }
                  } else if(model.pageCount==2){
                    if(_validateSecond(model) || model.secondPageValidation){
                      model.setSecondPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {

                      print("Second Page Error");
                    }
                  } else if( model.pageCount==3){
                    if(_validateThird(model) || model.thirdPageValidation){
                      model.setThirdPageValidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {
                      CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte verbinde dich mit deinem Arzt. Wenn du keinen Einladungscode bekommen hast, dann markiere das Feld ", width: _width);
                      print("Third Page Error");
                    }
                  } else if(model.pageCount ==4){
                    if(_validateFourth(model) || model.fourthPagevalidation){
                      model.setFourthPagevalidation(true);
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else {
                      CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe dein Geschlecht an", width: _width);
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
                      CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe deine Ethnizität an", width: _width);
                      print("Fifth Page Error");
                    }
                  } else if(model.pageCount ==6){
                    if(model.date !=null){
                      Navigator.of(context).pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
                    } else {
                      CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte wähle dein Geburtsdatum aus", width: _width);
                      print("Sixt Page Error");
                    }
                  }

                   /* if(formValidation && model.pageCount<=5 && _validateSecond(model) && _validateThird(model)){
                      print("Next");
                      model.pageCount<=5?model.setPageCount(++pageCount):null;
                      model.setIndicatorValue(indicatorValue=indicatorValue+0.2);
                      print("Pagecount value: ${model.pageCount}");
                    } else if(model.pageCount==6){
                      Navigator.of(context).pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
                    }*/

                  },
                  text: model.pageCount==6?"FERTIG":"WEITIER",
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

  Widget firstPage(RegisterViewModel model){
    return Form(
      key: _userKey,
        child: Column(
      children: <Widget>[
        Text("Account erstellen", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox( height: 30,),
        TextFormField(
          autovalidate: model.autoValidate,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "E-Mail"
          ),
          validator: validator.validateEmail,
        ),
        SizedBox( height: 30,),
        TextFormField(
          validator: validator.validatePassword,
          autovalidate: model.autoValidate,
          obscureText: visibility?false:true,
          decoration: InputDecoration(
              hintText: "Password",
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
      children: <Widget>[
        Text("Datenschutz", style: TextStyle(fontWeight: FontWeight.bold, fontSize:  _width/12),),
        SizedBox(height: 10,),
        Card(
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
                Checkbox(
                  value: model.checkbox1,
                  onChanged: (value) {
                    model.setCheckbox1(!model.checkbox1);
                  },
                ),
              ],
            ),
          ),
        ),
        Card(
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
                Checkbox(
                  value: model.checkbox2,
                  onChanged: (value) {
                    model.setCheckbox2(!model.checkbox2);
                  },
                ),
              ],
            ),
          ),
        ),
        Card(
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
                Checkbox(
                  value: model.checkbox3,
                  onChanged: (value) {
                    model.setCheckbox3(!model.checkbox3);
                  },
                ),
              ],
            ),
          ),
        ),
        /*CustomCheckBox(
          isRichText: true,
          checkValue: model.checkbox1,
        ),*/
      /*  CustomCheckBox(
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

  bool _validateSecond(RegisterViewModel model){
    if(model.checkbox1 && model.checkbox2 && model.checkbox3){
      return true;
    }
    return false;
  }
  
  Widget thirdPage(RegisterViewModel model){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Verbinde dich mit" "\ndeinem Arzt", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(height: 10,),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Einladungscode",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                Container(
                  height: 1,
                  width: _width,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                        child: Text(
                          "Ich stimme zu, dass mein Arzt Zugriff auf meine Daten hat. Siehe Datenschutzrichtlinie.",
                          style: TextStyle(fontSize: 18),
                        )),
                    Checkbox(
                      value: model.checkbox4,
                      onChanged: (value) {
                        model.setCheckbox4(!model.checkbox4);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
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
                Checkbox(
                  value: model.checkbox5,
                  onChanged: (value) {
                    model.setCheckbox5(!model.checkbox5);
                  },
                ),
              ],
            ),
          ),
        ),
      /*  CustomCheckBox(
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

  bool _validateThird(RegisterViewModel model){
    if(model.checkbox4 && model.checkbox5){
      return true;
    }
    return false;
  }
  
  Widget fourthPage(RegisterViewModel model){
    return Column(
      children: <Widget>[
        Text("Geschlecht", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        Column(
            children: <Widget>[
              InkWell(
                onTap: model.radioButton2 || model.radioButton3?null:() {
                  // model.setIsTapped(!model.isTapped);
                  model.setRadioButton1(!model.radioButton1);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Weiblich", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 20,
                          height: _height / 30,
                          decoration: BoxDecoration(
                              color: model.radioButton1 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !model.radioButton1 ? Colors
                                  .black : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: model.radioButton1 || model.radioButton3?null:() {
                  // model.setIsTapped(!model.isTapped);
                  model.setRadioButton2(!model.radioButton2);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Männlich", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 20,
                          height: _height / 30,
                          decoration: BoxDecoration(
                              color: model.radioButton2 ? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !model.radioButton2 ? Colors
                                  .black : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: model.radioButton1 || model.radioButton2?null:() {
                  // model.setIsTapped(!model.isTapped);
                  model.setRadioButton3(!model.radioButton3);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Anderes", style: TextStyle(fontSize: 18),),
                        Container(
                          width: _width / 20,
                          height: _height / 30,
                          decoration: BoxDecoration(
                              color: model.radioButton3? Styles.taiaGreen : Styles
                                  .whiteColor,
                              border: Border.all(color: !model.radioButton3 ? Colors
                                  .black : Styles.taiaGreen),
                              shape: BoxShape.circle
                          ),
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

  bool _validateFourth(RegisterViewModel model){
    if(model.radioButton1 || model.radioButton2 || model.radioButton3){
      return true;
    }
    return false;
  }

  Widget fifthPage(RegisterViewModel model){
    return Column(
      children: <Widget>[
        Text("Ethnizität", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
              itemCount: _checkList.length,
              itemBuilder: (_,index){
                return CheckboxListTile(
                  title: Text(_checkList[index].text),
                  value: _checkList[index].status,
                  onChanged: (value){
                    model.setFifthPageValidation(!model.fifthPageValidation);
                    setState(() {
                      _checkList[index].status = value;
                    });

                  },
                );
              }
          ),
        )
      ],
    );
  }

  Widget sixthPage(RegisterViewModel model){
    return Column(
      children: <Widget>[
        Text("Geburtsdatum", style: TextStyle(fontSize:  _width/12, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
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



}

class ListModel {
  String text;
  bool status;
  ListModel({this.text, this.status});
}
