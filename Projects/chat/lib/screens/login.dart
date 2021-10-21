import 'package:chat/screens/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat/models/const.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  void route() {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => core()));
    });
  }

  @override
  void initState() {
    route();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 5),
              Container(
                width: 270,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: c1,
                      style: styleData.STYLE(),
                      decoration: InputDecoration(hintText: "email"),
                    ),
                    TextField(
                      style: styleData.STYLE(),
                      controller: c2,
                      obscureText: _hide,
                      onChanged: (xd) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'password',
                        suffix: Visibility(
                          visible: c2.text.isNotEmpty,
                          child: GestureDetector(
                            onLongPressStart: (strt) {
                              setState(() {
                                _hide = false;
                              });
                            },
                            onLongPressEnd: (fnsh) {
                              setState(() {
                                _hide = true;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => _login(), child: Text('Login')),
                    TextButton(
                        onPressed: () => _signUp(), child: Text('Sign Up')),
                  ],
                ),
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }

  _signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: c1.text, password: c2.text)
          .whenComplete(() => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => core())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        styleData.TOAST("weak password");
      } else if (e.code == 'email-already-in-use') {
        styleData.TOAST("email elready in use");
      }
    } catch (e) {
      styleData.TOAST(e.toString());
    }
  }

  _login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: c1.text, password: c2.text)
          .whenComplete(() => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => core())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        styleData.TOAST("user not found");
      } else if (e.code == 'wrong-password') {
        styleData.TOAST("wrong password");
      }
    }
  }
}

TextEditingController c1 = TextEditingController(),
    c2 = TextEditingController();
bool _hide = true;
