import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/model/base_model.dart';
import 'package:flutter_taia_care/src/utils/encrypt.dart';

class RegisterViewModel extends BaseModel {
  int _pageCount = 1;
  double _indicatorValue = 0.1;
  bool _autoValidate = false;

  bool _isFirstTraversed=false;
  bool _isSecondTraversed=false;
  bool _isThirdTraversed=false;
  bool _isFourthTraversed=false;
  bool _isFifthTraversed=false;

  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  bool _checkbox6 = false;

  bool _radioButton1 = false;
  bool _radioButton2 = false;
  bool _radioButton3 = false;

  FocusNode _emailFocus = FocusNode();
  FocusNode _codeFocus = FocusNode();

  bool _firstPageValidation = false;
  bool _secondPageValidation = false;
  bool _thirdPageValidation = false;
  bool _fourthPagevalidation = false;
  bool _fifthPageValidation = false;
  bool _sixthPageValidation = false;

  bool _isAnderes = false;

  bool get isAnderes => _isAnderes;

  setIsAnderes(bool value) {
    _isAnderes = value;
    notifyListeners();
  }

  String _date;
  String _gender;
  List<String> _ethnicityList = List();

  List<String> get ethnicityList => _ethnicityList;


  FocusNode get emailFocus => _emailFocus;

  setEmailFocus(FocusNode value) {
    _emailFocus = value;
    notifyListeners();
  }

  FocusNode get codeFocus => _codeFocus;

  setCodeFocus(FocusNode value) {
    _codeFocus = value;
    notifyListeners();
  }

  setEthnicityList(List<String> value) {
    _ethnicityList = value;
    notifyListeners();
  }

  String get gender => _gender;

  setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  TextEditingController get emailController => _emailController;

  setEmailController(TextEditingController value) {
    _emailController = value;
    notifyListeners();
  }

  TextEditingController get passController => _passController;

  setPassController(TextEditingController value) {
    _passController = value;
    notifyListeners();
  }

  TextEditingController get codeController => _codeController;

  setCodeController(TextEditingController value) {
    _codeController = value;
    notifyListeners();
  }

  bool get firstPageValidation => _firstPageValidation;

  setFirstPageValidation(bool value) {
    _firstPageValidation = value;
    notifyListeners();
  }

  bool get secondPageValidation => _secondPageValidation;

  setSecondPageValidation(bool value) {
    _secondPageValidation = value;
    notifyListeners();
  }

  bool get thirdPageValidation => _thirdPageValidation;

  setThirdPageValidation(bool value) {
    _thirdPageValidation = value;
    notifyListeners();
  }

  bool get fourthPagevalidation => _fourthPagevalidation;

  setFourthPagevalidation(bool value) {
    _fourthPagevalidation = value;
    notifyListeners();
  }

  bool get fifthPageValidation => _fifthPageValidation;

  setFifthPageValidation(bool value) {
    _fifthPageValidation = value;
    notifyListeners();
  }

  bool get sixthPageValidation => _sixthPageValidation;

  setSixthPageValidation(bool value) {
    _sixthPageValidation = value;
    notifyListeners();
  }

  String get date => _date;

  setDate(String value) {
    _date = value;
    notifyListeners();
  }

  bool get radioButton1 => _radioButton1;

  setRadioButton1(bool value) {
    _radioButton1 = value;
    notifyListeners();
  }

  bool get radioButton2 => _radioButton2;

  setRadioButton2(bool value) {
    _radioButton2 = value;
    notifyListeners();
  }

  bool get radioButton3 => _radioButton3;

  setRadioButton3(bool value) {
    _radioButton3 = value;
    notifyListeners();
  }

  bool get autoValidate => _autoValidate;

  setAutoValidate(bool value) {
    _autoValidate = value;
    notifyListeners();
  }

  double get indicatorValue => _indicatorValue;

  setIndicatorValue(double value) {
    _indicatorValue = value;
    notifyListeners();
  }

  int get pageCount => _pageCount;

  setPageCount(int value) {
    _pageCount = value;
    notifyListeners();
  }

  bool get checkbox1 => _checkbox1;

  setCheckbox1(bool value) {
    _checkbox1 = value;
    notifyListeners();
  }

  bool get checkbox2 => _checkbox2;

  setCheckbox2(bool value) {
    _checkbox2 = value;
    notifyListeners();
  }

  bool get checkbox3 => _checkbox3;

  setCheckbox3(bool value) {
    _checkbox3 = value;
    notifyListeners();
  }

  bool get checkbox4 => _checkbox4;

  setCheckbox4(bool value) {
    _checkbox4 = value;
    notifyListeners();
  }

  bool get checkbox5 => _checkbox5;

  setCheckbox5(bool value) {
    _checkbox5 = value;
    notifyListeners();
  }

  bool get checkbox6 => _checkbox6;

  setCheckbox6(bool value) {
    _checkbox6 = value;
    notifyListeners();
  }

  void registerUser(BuildContext context) async {
    print("Registering user");
    try {
      // FirebaseUser user;
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passController.text)
          .then((currentUser) => Firestore.instance
                  .collection('patient')
                  .document(currentUser.user.uid)
                  .setData({
                'uid': currentUser.user.uid,
                'email': Encrypt.encryptEmail(emailController.text),
               //  'password': Encrypt.encryptPassword(passController.text),
               'connection_code'
                    : Encrypt.encryptConnectionCode(codeController.text),
                'gender': Encrypt.encryptGender(gender),
                'ethnicity': ethnicityList.toList(),
                'date_of_birth': date
              }).then((onValue) {
                state = ViewState.Idle;
                print('data entered in the firebase');
                Navigator.of(context)
                    .pushReplacementNamed(Constant.DASHBOARD, arguments: 0);
              }));
      //UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      //  userUpdateInfo.displayName = _displayName;

      // Navigator.of(context).pushReplacementNamed('/home');

    } catch (error) {
      print("Error is: $error");
/*      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          {
            state = ViewState.Idle;
            */ /*   _sheetController.setState(() {
              errorMsg = "This email is already in use.";
              _loading = false;
            });*/ /*
            */ /*  showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });*/ /*
          }
          break;
        case "ERROR_WEAK_PASSWORD":
          {
            */ /*   _sheetController.setState(() {
              errorMsg = "The password must be 6 characters long or more.";
              _loading = false;
            });*/ /*
            state = ViewState.Idle;
            */ /*  showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });*/ /*
          }
          break;
        default:
          {
            */ /*  _sheetController.setState(() {
              errorMsg = "";
            });*/ /*
          }
      }*/
    }
  }

  clearModel() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    setAutoValidate(false);
    setPageCount(1);
    setRadioButton3(false);
    setRadioButton2(false);
    setRadioButton1(false);
    setCheckbox6(false);
    setCheckbox5(false);
    setCheckbox4(false);
    setCheckbox3(false);
    setCheckbox2(false);
    setCheckbox1(false);
    setSixthPageValidation(false);
    setFifthPageValidation(false);
    setFourthPagevalidation(false);
    setThirdPageValidation(false);
    setSecondPageValidation(false);
    setFirstPageValidation(false);
    setDate(null);
    setIndicatorValue(0.1);
  }

  bool get isFirstTraversed => _isFirstTraversed;

  setIsFirstTraversed(bool value) {
    _isFirstTraversed = value;
    notifyListeners();
  }

  bool get isSecondTraversed => _isSecondTraversed;

  setIsSecondTraversed(bool value) {
    _isSecondTraversed = value;
    notifyListeners();
  }

  bool get isThirdTraversed => _isThirdTraversed;

  setIsThirdTraversed(bool value) {
    _isThirdTraversed = value;
    notifyListeners();
  }

  bool get isFourthTraversed => _isFourthTraversed;

  setIsFourthTraversed(bool value) {
    _isFourthTraversed = value;
    notifyListeners();
  }

  bool get isFifthTraversed => _isFifthTraversed;

  setIsFifthTraversed(bool value) {
    _isFifthTraversed = value;
    notifyListeners();
  }
}
