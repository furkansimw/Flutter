import 'package:flutter/material.dart';
import 'package:responsive_admin_panel_or_dashboard/main.dart';
import 'package:responsive_admin_panel_or_dashboard/pie.dart';
import 'package:responsive_admin_panel_or_dashboard/recentFiles.dart';

class storageDetails extends StatefulWidget {
  var x, y;
  storageDetails(this.x, this.y);

  @override
  _storageDetailsState createState() => _storageDetailsState();
}

class _storageDetailsState extends State<storageDetails> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => pie()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.x * 0.05, vertical: widget.y * 0.01),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff242736),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: widget.y * 0.1,
          width: widget.x,
          child: Center(
            child: Text(
              "Storage Details",
              style: TextStyle(fontSize: widget.x * 0.06, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
