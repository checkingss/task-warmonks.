import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils {}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}

/// validate phone number
String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your username';
  }
}

/// validate password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter a password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

/// name validator
String? validateField(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter the value';
  }
}

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
