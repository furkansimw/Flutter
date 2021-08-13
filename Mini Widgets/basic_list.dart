import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

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

var toolTip = SnackBar(content: Text("basili tut sil"));

class _HomeState extends State<Home> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      ScaffoldMessenger.of(context).showSnackBar(toolTip);
    });
  }

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onLongPressStart: (x) {
                    setState(() {
                      liste.removeAt(index);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(liste[index].isim, style: style),
                            Text(liste[index].soyisim, style: style),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          eklemek
              ? Container(
                  height: 60,
                  color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: x / 3,
                          child: TextField(
                              controller: soyisim,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "isim"))),
                      SizedBox(
                          width: x / 3,
                          child: TextField(
                              controller: isim,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "soyisim"))),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              liste.add(data(isim.text, soyisim.text));
                              isim.text = "";
                              soyisim.text = "";
                              eklemek = false;
                            });
                          },
                          child: Text("ekle")),
                    ],
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      eklemek = true;
                    });
                  },
                  child: Text("ekle"))
        ],
      ),
    );
  }
}

var style = TextStyle(fontSize: 26);
var liste = [];

class data {
  var isim, soyisim;
  data(this.isim, this.soyisim);
}

bool eklemek = false;
var isim = TextEditingController(), soyisim = TextEditingController();
