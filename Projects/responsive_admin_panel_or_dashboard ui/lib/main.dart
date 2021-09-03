import 'package:flutter/material.dart';
import 'package:responsive_admin_panel_or_dashboard/appBar.dart';
import 'package:responsive_admin_panel_or_dashboard/categories.dart';
import 'package:responsive_admin_panel_or_dashboard/drawer.dart';
import 'package:responsive_admin_panel_or_dashboard/pie.dart';
import 'package:responsive_admin_panel_or_dashboard/recentFiles.dart';
import 'package:responsive_admin_panel_or_dashboard/storageDetails.dart';

void main() {
  runApp(app());
}

var backgroundColor = "#1E1F2C";

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width; //* screen width
    var y = MediaQuery.of(context).size.height; //* screen height

    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(),
      backgroundColor: Color(0xff1E1F2C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBar(x, y, () => draverAcma()),
              categories(x, y),
              recentFiles(x, y),
              storageDetails(x, y),
            ],
          ),
        ),
      ),
    );
  }

  void draverAcma() {
    _scaffoldKey.currentState!.openDrawer();
  }
}
