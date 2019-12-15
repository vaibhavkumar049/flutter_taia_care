class Validator {
  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Gebe eine gültige E-Mail-Adresse ein";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email !";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required !";
    } else if(!regExp.hasMatch(value)){
      return "Mindestents 8 Zeichen, einen Großbuchstaben, einen Kleinbuchtaben und ein Sonderzeichen";
    }else {
      return null;
    }
  }

  String validatePatientID(String value) {
    if (value.length == 0) {
      return "Patient ID is Required !";
    } else {
      return null;
    }
  }

  String validatecaseNumber(String value) {
    if (value.length == 0) {
      return "Case No. is Required !";
    } else {
      return null;
    }
  }

  String validateProcedure(String value) {
    if (value.length == 0) {
      return "Procedure is Required !";
    } else {
      return null;
    }
  }

  String validateSurgeonApproach(String value) {
    if (value.length == 0) {
      return "Surgical Approcach is Required !";
    } else {
      return null;
    }
  }

  String validateNote(String value) {
    if (value.length == 0) {
      return "Field cannot be empty!";
    } else {
      return null;
    }
  }
}
