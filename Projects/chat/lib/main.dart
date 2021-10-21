import 'package:chat/models/model.dart';
import 'package:chat/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ma());
}

// ignore: camel_case_types
class ma extends StatefulWidget {
  @override
  _maState createState() => _maState();
}

// ignore: camel_case_types
class _maState extends State<ma> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
