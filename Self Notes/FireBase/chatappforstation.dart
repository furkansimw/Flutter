import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  var fire = FirebaseFirestore.instance;
  int limit = 30;

  @override
  void initState() {
    //akisi saglama
    get();
  }

  get() {
    fire
        .collection('furkan') //koleksiyon ismi serbest
        .orderBy("date",
            descending:
                true) // mesajlari doc un icinden date e gore siparis veriyor descending tersine
        .limit(limit) // limitli sekilde hizli ve performansli icin
        .snapshots()
        .listen(
      (event) {
        setState(() {
          //her akis geldiginde bellekteki listeyi siliyor az kb
          msgs.clear();
        });
        for (var element in event.docs) {
          setState(() {
            msgs.add(element.data());
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            TextField(controller: c1), //buraya mesaj girisi
            RaisedButton(onPressed: () {
              var date = DateTime.now(); //simdiki tarih
              //
              String month = date.month.toString();
              String day = date.day.toString();
              String hour = date.hour.toString();
              String min = date.minute.toString();
              String sec = date.second.toString();

              if (int.parse(month) < 10) {
                month = '0$month';
                //return 0 - 10
                // 3 x => 03
              }
              if (int.parse(day) < 10) {
                day = '0$day';
              }
              if (int.parse(hour) < 10) {
                hour = '0$hour';
              }
              if (int.parse(min) < 10) {
                min = '0$min';
              }
              if (int.parse(sec) < 10) {
                sec = '0$sec';
              }
              var msg = {
                "msg": c1.text.toString(),
                "sender": "furkan", //q
                "date": '${date.year}-$month-$hour-$min-$sec', //this for order
              };
              fire.collection('furkan').doc().set(msg).whenComplete(() {
                setState(() {
                  c1.text = '';
                });
              });
            }),
            IconButton(
                onPressed: () {
                  //more older msg showing
                  setState(() {
                    limit = 50;
                    get();
                  });
                },
                icon: Icon(Icons.add)),
            Expanded(
              child: ListView.builder(
                itemCount: msgs.length,
                reverse: true,
                itemBuilder: (c, i) {
                  return Text(msgs[i]["msg"].toString(),
                      style: TextStyle(
                          fontSize:
                              msgs[i]["sender"].contains('furkan') ? 20 : 15));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List msgs = [];

var c1 = TextEditingController();
