import 'package:flutter_taia_care/src/model/base_model.dart';

class RegisterViewModel extends BaseModel {
  int _pageCount=1;
  double _indicatorValue =0.1;
  bool _autoValidate= false;
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  bool _checkbox6 = false;

  bool get checkbox6 => _checkbox6;

  setCheckbox6(bool value) {
    _checkbox6 = value;
    notifyListeners();
  }

  bool _firstPageValidation=false;
  bool _secondPageValidation = false;
  bool _thirdPageValidation = false;
  bool _fourthPagevalidation= false;
  bool _fifthPageValidation = false;
  bool _sixthPageValidation= false;



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

  String _date;


  String get date => _date;

  setDate(String value) {
    _date = value;
    notifyListeners();
  }

  bool _radioButton1 = false;
  bool _radioButton2 = false;
  bool _radioButton3 = false;


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




}