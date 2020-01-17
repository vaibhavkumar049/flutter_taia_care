import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/utils/firebase_error.dart';
import 'package:flutter_taia_care/src/utils/validator.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailLoginController = TextEditingController();
  double _height;
  double _width;
  Validator validator = Validator();
  GlobalKey<FormState> _key = new GlobalKey();
  String emailHint = "Email";
  FocusNode _emailFocus;
  bool _isEmailVerified = true;
  bool autoValidate=false;
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Styles.taiaGreen,size: _width/10,), onPressed: (){
          Navigator.of(context).pop();
        },),
        backgroundColor: Styles.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Stack(
          children: <Widget>[
            Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Gebe deine E-Mail-Adresse ein, mit der du dein taiaCare Konto erstellt hast. Dann können wir dir einen Link zum Zurücksetzen des Passworts zuschicken.",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12),
                ),
                SizedBox(height: 20,),
                Form(
                  key: _key,
                  child: Container(
                   // height: _height,
                    //padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: autoValidate ?validator.validateEmail(emailLoginController.text)==null ? null:BoxDecoration(
                              border: Border.all(
                                  color: Styles.strongRed, width: 2),
                              borderRadius: BorderRadius.circular(30)):null,
                          child: TextFormField(
                            autovalidate: autoValidate,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocus,
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: "E-Mail",
                              contentPadding: EdgeInsets.all(15),
                              border: validator.validateEmail(emailLoginController.text)==null?null:InputBorder.none
                            ),
                            //validator: validator.validateEmail,
                          ),
                        ),
                        SizedBox(),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:  _isLoading
                  ? CircularProgressIndicator()
                  : _loginButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: autoValidate? validator.validateEmail(emailLoginController.text)==null
              ?SizedBox()
              :Text(validator.validateEmail(emailLoginController.text), style: TextStyle(color: Styles.strongRed),):SizedBox(),
        ),
        InkWell(
          splashColor: Styles.transparent,
          highlightColor: Styles.transparent,
          onTap: () {
            setState(() {
              autoValidate = true;
            });
          /*  if (emailLoginController.text.length == 0) {
              setState(() {
                emailHint = "Email";
              });
            }
            if (validator.validateEmail(emailLoginController.text) == null) {
              _sendResetEmail();
              _isEmailVerified = true;
            } else if (validator.validateEmail(emailLoginController.text) != null) {
              _isEmailVerified = false;
            }*/
            if (_key.currentState.validate()) {
              _sendResetEmail();
            }
          },
          child: Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Styles.taiaGreen,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              "Send",
              style: TextStyle(
                  color: Styles.whiteColor,
                  fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  void _sendResetEmail() async {
    setState(() {
      _isLoading = true;
    });
    print(emailLoginController.text);

    FirebaseUser user;
    await _auth
        .sendPasswordResetEmail(
      email: emailLoginController.text,
    )
        .then((v) {
      setState(() {
        _isLoading = false;
      });

      CustomDialogBox.showAlertDialog(context,"Alert!","Confirmation has been sent to your Email", width: _width);
    }).catchError(
          (e) {
        print(checkAuthError(e.toString()));
        CustomDialogBox.showAlertDialog(context,"Alert!",checkAuthError(e.toString()), width: _width);
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
      });
    } else {}
  }
}