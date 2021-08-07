import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  var x, y;
  var function;
  appBar(this.x, this.y, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1e1f2c),
      width: x,
      height: y / 10,
      child: Row(
        children: [
          Spacer(flex: 1),
          //menu butonu
          IconButton(
            onPressed: function,
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
          ),
          Spacer(flex: 2),
          //arama alani
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Color(0xff242736),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: x * 0.38,
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefix: SizedBox(
                            width: 10), //arama kisminin basina kucuk bir bosluk
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: Colors.white30, fontSize: x * 0.047)),
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                ), //icon
                Container(
                  height: x * 0.099,
                  width: x * 0.095,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xff208CFF),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: x * 0.05,
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 2),
          //profil
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: y * 0.019, bottom: y * 0.019),
                  child: Container(
                    height: double.infinity,
                    width: x * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(color: Colors.white38), //cerceve
                      color: Color(0xff242736),
                    ),
                    child: Row(
                      children: [
                        Spacer(flex: 1),
                        Image.asset(
                          "assets/images/profile_pic.png", //resim
                        ),
                        Spacer(flex: 1),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: x * 0.075,
                        ),
                        Spacer(flex: 1),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: x * 0.04), //son
              ],
            ),
          ),
        ],
      ),
    );
  }
}
