import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/base_model.dart';

class LoginProvider extends BaseModel {
bool _isEmailVerified =false;
bool _isPasswordVerified = false;
bool _visibility = false;
bool _autoValidate = false;
bool _isLoading = false;

TextEditingController _emailLoginController = TextEditingController();
TextEditingController _passwordLoginController = TextEditingController();


clearModel(){
  setIsEmailVerified(false);
  setIsPasswordVerified(false);
  setVisibility(false);
  setAutoValidate(false);
  setIisLoading(false);
  setEmailLoginController(null);
  setPasswordLoginController(null);
}


TextEditingController get emailLoginController => _emailLoginController;

setEmailLoginController(TextEditingController value) {
  _emailLoginController = value;
  notifyListeners();
}

bool get visibility => _visibility;

setVisibility(bool value) {
  _visibility = value;
  notifyListeners();
}



bool get isEmailVerified => _isEmailVerified;

setIsEmailVerified(bool value) {
  _isEmailVerified = value;
  notifyListeners();
}

bool get isPasswordVerified => _isPasswordVerified;

setIsPasswordVerified(bool value) {
  _isPasswordVerified = value;
  notifyListeners();
}

bool get autoValidate => _autoValidate;

setAutoValidate(bool value) {
  _autoValidate = value;
  notifyListeners();
}

bool get isLoading => _isLoading;

setIisLoading(bool value) {
  _isLoading = value;
  notifyListeners();
}

TextEditingController get passwordLoginController => _passwordLoginController;

setPasswordLoginController(TextEditingController value) {
  _passwordLoginController = value;
  notifyListeners();
}

}