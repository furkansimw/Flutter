import 'package:flutter/material.dart';
import 'package:chat/models/const.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                    ElevatedButton(onPressed: () {}, child: Text('Login')),
                    TextButton(onPressed: () {}, child: Text('Sign Up')),
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
}

TextEditingController c1 = TextEditingController(),
    c2 = TextEditingController();
bool _hide = true;
