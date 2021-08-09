import 'package:flutter/material.dart';
import 'package:todo/App.dart';

void main() {
  runApp(core());
}

class core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
