import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

FirebaseFirestore fire = FirebaseFirestore.instance;

class auth {
  static void route(BuildContext context) {
    //!AUTHCHECKER
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => core(),
          ),
        ),
      );
    } else {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ),
        ),
      );
    }
  }

  static void fireLogin(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      route(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        tools.toast('user not found');
      } else if (e.code == 'wrong-password') {
        tools.toast('wrong password');
      }
    }
  }

  static void fireSignUp(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      fireCreate(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        tools.toast('weak password');
      } else if (e.code == 'email-already-in-use') {
        tools.toast('email already in use');
      }
    } catch (e) {
      tools.toast(e.toString());
    }
  }

  static void fireCreate(BuildContext context) {
    //!
    String _userEmail = FirebaseAuth.instance.currentUser!.email!;
    Map<String, dynamic> newUser = {
      'email': _userEmail,
      'pp': NONEPP,
      'username': 'user',
      'messages': [],
      'contacts': [],
      'reqs': []
    };
    fire
        .collection('users')
        .doc(_userEmail)
        .set(newUser)
        .whenComplete(() => route(context));
  }
}

class tools {
  static void toast(String msg,
          {Color backgroundColor = Colors.blue,
          Color textColor = Colors.white,
          double fontSize = 16}) =>
      Fluttertoast.showToast(
          msg: msg,
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: fontSize,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
}
