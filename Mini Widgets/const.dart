import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// yaml. -> fluttertoast: ^8.0.8
class styleData {
  static TextStyle STYLE(
          //textfield for
          {double fs = 18,
          Color c = Colors.black,
          FontWeight fw = FontWeight.normal}) =>
      TextStyle(fontSize: fs, color: c, fontWeight: fw);

  static TOAST(
    String msg, {
    Color bg = Colors.blue,
    double fs = 18,
    Color tc = Colors.white,
  }) =>
      Fluttertoast.showToast(
          msg: msg,
          backgroundColor: bg,
          fontSize: fs,
          textColor: tc,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);

  static SNACKBAR(String msg) => SnackBar(
        //ScaffoldMessenger.of(context).showSnackBar(styleData.SNACKBAR(""));
        content: Text(
          msg,
          style: STYLE(c: Colors.white),
        ),
      );
}
