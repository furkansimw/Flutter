import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:not_defteri/main.dart';
import 'package:not_defteri/ozelsayfa.dart';
import 'package:not_defteri/renksecme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'dart:async';

class note extends StatefulWidget {
  @override
  _noteState createState() => _noteState();
}

var tf1 = TextEditingController();
var tf2 = TextEditingController();

class _noteState extends State<note> {
  @override
  void initState() {
    setState(() {
      renk = arkaplanrenkler[indeks];
      if (yeninoteklemekomudu == true) {
        setState(() {
          tf1.text = "";
          tf2.text = "";
        });
      }
      if (yeninoteklemekomudu == false) {
        setState(() {
          tf1.text = notbasliklari[indeks];
          tf2.text = noticerikleri[indeks];
        });
      }
    });
  }

  veriEkle() {
    FirebaseFirestore.instance
        .collection(isimx)
        .doc('icerikler')
        .set({"basliklar": notbasliklari});
    FirebaseFirestore.instance
        .collection(isimx)
        .doc('icerikler')
        .update({'notlar': noticerikleri});
  }

  veriOkuma() {
    FirebaseFirestore.instance
        .collection(isimx)
        .doc('icerikler')
        .get()
        .then((value) {
      setState(() {
        notbasliklari = value.data()["basliklar"];
      });
    });
    FirebaseFirestore.instance
        .collection(isimx)
        .doc('icerikler')
        .get()
        .then((value) {
      setState(() {
        noticerikleri = value.data()["notlar"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    var widht = screen.size.width;
    var height = screen.size.height;
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
            backgroundColor: renk.shade200,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                size: widht / 25,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AnaSayfa()));
              },
            ),
            title: Text(
              "Not",
              style: TextStyle(fontSize: widht / 25),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widht / 30),
                child: renksecmeler(),
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  maxLines: 1,
                  style: TextStyle(color: Colors.green, fontSize: widht / 27),
                  maxLength: 20,
                  decoration: InputDecoration(hintText: "Baslik Giriniz"),
                  controller: tf1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  maxLines: null,
                  style: TextStyle(
                      color: Colors.orangeAccent, fontSize: widht / 25),
                  maxLength: height.toInt(),
                  decoration: InputDecoration(hintText: "Birseyler Giriniz"),
                  controller: tf2,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(25),
          child: FloatingActionButton(
            child: Icon(
              Icons.save,
              color: Colors.white,
              size: widht / 23,
            ),
            backgroundColor: Colors.amber,
            onPressed: () {
              setState(() {
                if (yeninoteklemekomudu == false) {
                  if (tf1.text.length < 1) {
                    notbasliklari[indeks] = "isimsiz $indeks";
                    noticerikleri[indeks] = tf2.text;
                  } else {
                    notbasliklari[indeks] = tf1.text;
                    noticerikleri[indeks] = tf2.text;
                  }
                }

                if (yeninoteklemekomudu == true) {
                  setState(() {});

                  if (tf1.text.length < 1) {
                    notbasliklari.add("isimsiz $indeks");
                    noticerikleri.add(tf2.text);
                  } else {
                    notbasliklari.add(tf1.text);
                    noticerikleri.add(tf2.text);
                  }
                }
                setState(() {
                  Timer(Duration(microseconds: 750), () {
                    veriEkle();
                  });
                });

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => app()));
              });
            },
          ),
        ));
  }
}
