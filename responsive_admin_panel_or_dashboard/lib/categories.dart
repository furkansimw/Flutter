import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class categories extends StatelessWidget {
  var x, y;
  categories(this.x, this.y);
  @override
  Widget build(BuildContext context) {
    return Container(
      //myfiles - add new
      width: x,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Files",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: x * 0.055,
                        color: Colors.white)),
                //1
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Color(0xff208CFF),
                  ),
                  width: x * 0.33,
                  height: y * 0.05,
                  child: Center(
                    //in text
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("+",
                            style: TextStyle(
                                fontSize: x * 0.06, color: Colors.white)),
                        Text("  "),
                        Text("Add New",
                            style: TextStyle(
                                fontSize: x * 0.04, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //#kategories !
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              object(x, y, "assets/icons/doc_file.svg", "Documents", 5,
                  333), //width height icon title rate(stick length) gb
              object(x, y, "assets/icons/google_drive.svg", "Google Drive", 5,
                  4131)
            ],
          ),
          SizedBox(height: y * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              object(x, y, "assets/icons/one_drive.svg", "One Drive", 2, 33),
              object(x, y, "assets/icons/drop_box.svg", "Documents", 9, 8131)
            ],
          ),
        ],
      ),
    );
  }
}

//every one container
class object extends StatelessWidget {
  var x, y; //width height
  var icon; //svg file
  var title; //title
  double rate, fileNumber; //stick length and gb

  object(this.x, this.y, this.icon, this.title, this.rate, this.fileNumber);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: x * 0.43, //1 line 2 object
      height: y * 0.22,
      decoration: BoxDecoration(
          color: Color(0xff242736),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: x * 0.05, vertical: y * 0.02),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: x * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "$icon",
                    width: x * 0.085,
                  ),
                  Icon(
                    Icons.more_vert_sharp,
                    color: Colors.grey,
                    size: x * 0.065,
                  ),
                ],
              ),
            ),
            SizedBox(height: x * 0.05),
            Row(
              children: [
                Text("$title",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: x * 0.045,
                        color: Colors.white70)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: x * 0.42,
              height: 30,
              child: Stack(
                children: [
                  Container(
                    width: rate * 10,
                    height: 5,
                    color: icon == "assets/icons/google_drive.svg"
                        ? Colors.yellow.shade700
                        : rate < 3
                            ? Colors.blue.shade200
                            : Colors.blue,
                  ),
                  Container(
                    width: x * 0.3,
                    height: 5,
                    color: Colors.white10,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${fileNumber.toInt()} Files",
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  "${(fileNumber / 12).toInt()} GB",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
