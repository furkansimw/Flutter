import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class recentFiles extends StatefulWidget {
  var x, y;
  recentFiles(this.x, this.y);

  @override
  _recentFilesState createState() => _recentFilesState();
}

class _recentFilesState extends State<recentFiles> {
  var style = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontStyle: FontStyle.italic);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.x * 0.05, vertical: widget.y * 0.02),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff242736),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: widget.y * 0.5,
        width: widget.x,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("Recent Files",
                      style: TextStyle(
                          fontSize: widget.x * 0.05, color: Colors.white)),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(flex: 1),
                Text("File Name", style: style),
                Spacer(flex: 5),
                Text("Date", style: style),
                Spacer(flex: 4),
                Text("Size", style: style),
                Spacer(flex: 3),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: items.length,
                itemExtent: 80,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.white60),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              width: widget.x * 0.075,
                              height: widget.y * 0.04,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child:
                                      SvgPicture.asset(items[index].iconPath))),
                          Spacer(flex: 2),
                          SizedBox(
                            width: widget.x * 0.22,
                            child: Text(
                              items[index].name,
                              style: TextStyle(
                                  fontSize: widget.x * 0.045,
                                  color: Colors.white),
                            ),
                          ),
                          Spacer(flex: 4),
                          SizedBox(
                            width: widget.x * 0.26,
                            child: Text(items[index].date,
                                style: TextStyle(
                                    fontSize: widget.x * 0.04,
                                    color: Colors.white)),
                          ),
                          Spacer(flex: 4),
                          Text(items[index].size,
                              style: TextStyle(
                                  fontSize: widget.x * 0.045,
                                  color: Colors.white)),
                          Spacer(flex: 4),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var items = [
  itemProp("assets/icons/xd_file.svg", "XD File", "01 - 03 - 2021", "3.5mb"),
  itemProp(
      "assets/icons/Figma_file.svg", "Figma File", "07 - 03 - 2021", "8.5mb"),
  itemProp(
      "assets/icons/Documents.svg", "Document", " 11 - 03 - 2021", "1.5mb"),
  itemProp(
      "assets/icons/sound_file.svg", "Sound File", "05 - 02 - 2020", "2.5mb"),
  itemProp(
      "assets/icons/media_file.svg", "Media File", "02 - 03 - 2021", "4.5mb"),
  itemProp(
      "assets/icons/excle_file.svg", "Exel File", "05 - 03 - 2021", "9.5mb"),
];

class itemProp {
  var iconPath;
  var name;
  var date;
  var size;
  itemProp(this.iconPath, this.name, this.date, this.size);
}
