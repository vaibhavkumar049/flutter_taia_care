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
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:flutter_taia_care/src/utils/firebase_error.dart';
import 'package:flutter_taia_care/src/utils/validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _height;
  double _width;
  GlobalKey<FormState> _userKey = GlobalKey();
  Validator validator = Validator();
  bool visibility = false;
  bool autoValidate=false;
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
     backgroundColor: Styles.whiteColor,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Styles.taiaGreen,size: _width/10,), onPressed: (){
          Navigator.of(context).pop();
        },),
        backgroundColor: Styles.whiteColor,
        elevation: 0,
      ),
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
       // alignment: Alignment.center,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            fieldForm(),
            _isLoading
                ? CircularProgressIndicator()
                :  CustomButton(
              onTap: (){
                setState(() {
                  autoValidate = !autoValidate;
                });
                if(_userKey.currentState.validate()){
                  print("Checking Validation");
                  Navigator.of(context).pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
                }
              },
              text: "Einloggen",
              isDelete: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget fieldForm(){
    return Form(
        key: _userKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Einloggen", style: TextStyle(fontSize: _width/12, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox( height: 30,),
            TextFormField(
              autovalidate: autoValidate,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "E-Mail"
              ),
              validator: validator.validateEmail,
            ),
            SizedBox( height: 30,),
            TextFormField(
              validator: validator.validatePassword,
              autovalidate: autoValidate,
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
            SizedBox( height: 30,),
            InkWell(onTap: (){
              Navigator.of(context).pushNamed(Constant.RESETPASSWORD);
            },child: Text("Passwort vergessen?", style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),))
          ],
        ));
  }

  void _signInWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });
    print(emailLoginController.text);
    print(passwordLoginController.text);
    FirebaseUser user;
    await _auth
        .signInWithEmailAndPassword(
      email: emailLoginController.text,
      password: passwordLoginController.text,
    )
        .then((AuthResult authResult) {
      user = authResult.user;
     /* FirestoreProvider().addData(
          emailLoginController.text, passwordLoginController.text, user.uid);*/
    }).catchError(
          (e) {
        print(checkAuthError(e.toString()));
        CustomDialogBox.showAlertDialog(context, "Alert!",checkAuthError(e.toString()), width: _width);
        // showErrorText();
        setState(() {
          _isLoading = false;
        });
        print(e.toString());
      },
    );

    if (user != null) {
      setState(() {
        _isLoading = false;

        print(user.uid);
        Navigator.of(context).pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
      });
    } else {}
  }
}
