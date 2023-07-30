import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/practical_method.dart';


void showToast(String message){

  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(PracticalMethod.HexaColorConvertColor("#e2e2e3")),
      textColor: Color(PracticalMethod.HexaColorConvertColor("#ba1616")),
      fontSize: 16.0
  );
}