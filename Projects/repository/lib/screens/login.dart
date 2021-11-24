import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repository/data/data.dart';
import 'package:repository/screens/core.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * .12),
              Container(
                height: size.height * .45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: c1,
                      style: style,
                    ),
                    TextField(
                      controller: c2,
                      style: style,
                      obscureText: true,
                    ),
                    ElevatedButton(
                        onPressed: () => _login(), child: Text('Login')),
                    TextButton(
                        onPressed: () => _signUp(), child: Text('Sign Up')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: c1.text, password: c2.text);
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => core()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast('user not found');
      } else if (e.code == 'wrong-password') {
        toast('wrong password');
      }
    }
  }

  void _signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: c1.text, password: c2.text);
      _fire();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toast('weak password');
      } else if (e.code == 'email-already-in-use') {
        toast('email already in use');
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  void _fire() {
    var email = FirebaseAuth.instance.currentUser!.email!;
    var newUser = {'email': email, 'pp': pp, 'username': 'untiled', 'repo': []};
    fire.collection('users').doc(email).set(newUser).whenComplete(() =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => core())));
  }

  TextEditingController c1 = TextEditingController(),
      c2 = TextEditingController();
  TextStyle style = const TextStyle(fontSize: 16);
}

String pp =
    'https://firebasestorage.googleapis.com/v0/b/repository-9cdf3.appspot.com/o/none.jpg?alt=media&token=101a90ba-fd11-42ea-b268-8991c1a0744f';
