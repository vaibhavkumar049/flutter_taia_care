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
  bool _isEmailVerified = true;
  bool autoValidate=false;
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(gradient: Styles.appBackGradient),
      child: Scaffold(
        backgroundColor: Styles.whiteColor,
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Styles.taiaGreen,size: _width/10,), onPressed: (){
            Navigator.of(context).pop();
          },),
          backgroundColor: Styles.whiteColor,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        !_isEmailVerified
                            ? Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Text(
                                validator.validateEmail(
                                    emailLoginController.text),
                                style: TextStyle(
                                    color: Styles.redColor, fontSize: 12),
                              ),
                            ),
                          ],
                        )
                            : SizedBox(),
                        Container(
                          decoration: _isEmailVerified
                              ? BoxDecoration()
                              : BoxDecoration(
                              border: Border.all(
                                  color: Styles.redColor, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child:  TextFormField(
                            autovalidate: autoValidate,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "E-Mail"
                            ),
                            validator: validator.validateEmail,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _isLoading
                            ? CircularProgressIndicator()
                            : _loginButton(),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Input your account email, and we'll send you a link to reset your password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      splashColor: Styles.transparent,
      highlightColor: Styles.transparent,
      onTap: () {
        if (emailLoginController.text.length == 0) {
          setState(() {
            emailHint = "Email";
          });
        }
        if (validator.validateEmail(emailLoginController.text) == null) {
          _sendResetEmail();
          _isEmailVerified = true;
        } else if (validator.validateEmail(emailLoginController.text) != null) {
          _isEmailVerified = false;
        }
      },
      child: Container(
        height: 40,
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