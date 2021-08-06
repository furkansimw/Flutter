import 'package:flutter/material.dart';
import 'package:responsive_admin_panel_or_dashboard/pie.dart';

class storageDetails extends StatelessWidget {
  var x, y;
  storageDetails(this.x, this.y);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => pie()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: x * 0.05, vertical: y * 0.01),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff242736),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: y * 0.1,
          width: x,
          child: Center(
            child: Text(
              "Storage Details",
              style: TextStyle(fontSize: x * 0.06, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
