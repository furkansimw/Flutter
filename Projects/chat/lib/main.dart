import 'package:chat/models/model.dart';
import 'package:chat/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
