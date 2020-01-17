import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/firebase/firestore_provider.dart';
import 'package:flutter_taia_care/src/provider/login_provider.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:flutter_taia_care/src/utils/base_view.dart';
import 'package:flutter_taia_care/src/utils/firebase_error.dart';
import 'package:flutter_taia_care/src/utils/validator.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _height;
  double _width;
  GlobalKey<FormState> _userKey = GlobalKey();
  Validator validator = Validator();

  bool _isError=false;
  FocusNode _emailFocus = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return BaseView<LoginProvider>(
      onModelReady: null,
      builder: (_,model,__) => Scaffold(
        backgroundColor: Styles.whiteColor,
       // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Styles.taiaGreen,
              size: _width / 10,
            ),
            onPressed: () {
              _emailFocus.unfocus();
              model.clearModel();
              Navigator.of(context).pop();

              },
          ),
          backgroundColor: Styles.whiteColor,
          elevation: 0,
        ),
        //errorMessage()!=null?Flexible(child: Text(errorMessage(), style: TextStyle(color: Styles.strongRed),)):SizedBox(),
        body: Stack(
          children: <Widget>[
            Container(
              //color: Colors.red,
              height: _height,
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              //margin: EdgeInsets.only( bottom: _height/10,),
              // alignment: Alignment.center,
              child:  fieldForm(model),
            ),
             Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _height,
                padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    model.autoValidate?errorMessage(model)!=null?Flexible(child: Text(errorMessage(model), style: TextStyle(color: Styles.strongRed),)):SizedBox():SizedBox(),
                    model.isLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                      onTap: () {
                       model.setAutoValidate(true);
                        if (validator.validateEmail(model.emailLoginController.text)==null && validator.validatePassword(model.passwordLoginController.text)==null) {
                          print("Checking Validation");
                         model.setIisLoading(true);
                         model.setIsEmailVerified(true);
                         model.setIsPasswordVerified(true);
                           _signInWithEmailAndPassword(model);
                          //Navigator.of(context).pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
                        } else{
                         /* setState(() {
                            _isError = !_isError;
                          });*/
                        }
                      },
                      text: "Einloggen",
                      isDelete: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String errorMessage(LoginProvider model){
    if(model.emailLoginController.text.length==0 || model.passwordLoginController.text.length==0){
      return "Gebe eine gültige E-Mail Adresse und ein gültiges Passwort ein.";
    } else if(model.emailLoginController.text.length>0 &&validator.validatePassword(model.passwordLoginController.text)==null ){
      if(validator.validateEmail(model.emailLoginController.text)!=null){
        return validator.validateEmail(model.emailLoginController.text);
      }
    }else if(model.passwordLoginController.text.length>0){
      if(validator.validatePassword(model.passwordLoginController.text)!=null){
        return validator.validatePassword(model.passwordLoginController.text);
      }
    }
    return null;
  }

  Widget fieldForm(LoginProvider model) {
    // errorMessage()!=null?Flexible(child: Text(errorMessage(), style: TextStyle(color: Styles.strongRed),)):SizedBox(),
    return Form(
        key: _userKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: _height/2.5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Einloggen",
                  style: TextStyle(
                      fontSize: _width / 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
               decoration: model.autoValidate ?model.isEmailVerified ? null:BoxDecoration(
                      border: Border.all(
                          color: Styles.strongRed, width: 2),
                      borderRadius: BorderRadius.circular(30)):null,
              child: TextFormField(
                controller: model.emailLoginController,
                focusNode: _emailFocus,
                autofocus: true,
                autovalidate: model.autoValidate,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "E-Mail",
                      border: model.autoValidate?model.isEmailVerified? null: InputBorder.none:null,
                    contentPadding: EdgeInsets.only(top: 15, bottom: 15)
                ),
               // validator: validator.validateEmail,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration:  model.autoValidate?model.isPasswordVerified? null:BoxDecoration(
                  border: Border.all(
                      color: Styles.strongRed, width: 2),
                  borderRadius: BorderRadius.circular(30)):null,
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: model.passwordLoginController,
                //validator: validator.validatePassword,
                autovalidate: model.autoValidate,
                obscureText: model.visibility ? false : true,
                decoration: InputDecoration(
                  hintText: "Passwort",
                  border:  model.autoValidate?model.isPasswordVerified? null:InputBorder.none:null,
                   // contentPadding: EdgeInsets.all(10)
                  suffixIcon: InkWell(
                      onTap: () {
                       model.setVisibility(!model.visibility);

                        print("visibility");
                      },
                      child: Icon(
                        model.visibility ? Icons.visibility : Icons.visibility_off,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Constant.RESETPASSWORD);
                  model.clearModel();
                },
                child: Text(
                  "Passwort vergessen?",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                )),



          ],
        ),
    );
  }

  void _signInWithEmailAndPassword(LoginProvider model) async {
    print(model.emailLoginController.text);
    print(model.passwordLoginController.text);
    FirebaseUser user;
    await _auth
        .signInWithEmailAndPassword(
          email: model.emailLoginController.text,
          password: model.passwordLoginController.text,
        )
        .then((authResult) => Firestore.instance
                .collection('patients')
                .document(authResult.user.uid)
                .get()
                .then((result) {
              print("Sign in Successful");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Constant.DASHBOARD,(Route<dynamic> route) => false, arguments: 0);
            }))
        .catchError(
      (e) {
        print(checkAuthError(e.toString()));
        CustomDialogBox.showAlertDialog(
            context, "Alert!", checkAuthError(e.toString()),
            width: _width);
        // showErrorText();
       /* setState(() {
          _isLoading = false;
        });*/
        print(e.toString());
      },
    );

    if (user != null) {
      model.setIisLoading(false);
      print(user.uid);
      Navigator.of(context)
          .pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
    } else {}
  }
}
