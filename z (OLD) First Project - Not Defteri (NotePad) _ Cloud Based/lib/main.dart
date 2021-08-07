import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:not_defteri/renksecme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:not_defteri/ozelsayfa.dart';
import 'note.dart';
import 'ozelsayfa.dart';
import 'package:not_defteri/ozelsayfa.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

var refreshc = Colors.amber[300];

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

var yeninoteklemekomudu = false;
var indeks = 0;
var renk = arkaplanrenkler[indeks];
var notbasliklari = [];
var noticerikleri = [];
var silmebutonuetkin = false;

class _AnaSayfaState extends State<AnaSayfa> {
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
  void initState() {
    setState(() {
      yeninoteklemekomudu = false;
      renk = arkaplanrenkler[indeks];
      if (oturum) {
        veriOkuma();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    var widht = screen.size.width;
    var height = screen.size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent.shade100,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(widht / 10),
          child: AppBar(
            backgroundColor: Colors.lightBlueAccent.shade200,
            shadowColor: renk.shade700,
            centerTitle: true,
            title: Row(
              children: [
                Text(
                  "Notlar ",
                  style: TextStyle(fontSize: widht / 18),
                ),
                Text(
                  oturum ? '$isimx' : 'Oturum Aciniz',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: widht / 18,
                      color: Color(0xffffb703)),
                ),
              ],
            ),
            actions: [
              Visibility(
                visible: oturum,
                child: IconButton(
                    icon: Icon(
                      Icons.refresh,
                      size: widht / 22,
                      color: refreshc,
                    ),
                    onPressed: () {
                      setState(() {
                        refreshc = Colors.amber[300];
                      });
                      veriOkuma();
                      Timer(Duration(seconds: 15), () {
                        setState(() {
                          refreshc = Colors.red;
                        });
                      });
                    }),
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.cloud,
                  size: widht / 20,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ozelsayfa()));
                },
              ),
              SizedBox(
                width: screen.size.width / 20,
              ),
            ],
          ),
        ),
        body: oturum
            ? GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20),
                children: List.generate(notbasliklari.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onLongPress: () {
                          setState(
                            () {
                              silmebutonuetkin = true;
                              Timer(Duration(seconds: 2), () {
                                setState(() {
                                  silmebutonuetkin = false;
                                });
                              });
                            },
                          );
                        },
                        onTap: () {
                          setState(() {
                            renk = arkaplanrenkler[index];
                            indeks = index;
                            yeninoteklemekomudu = false;
                            silmebutonuetkin = false;
                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (cotext) => note()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: arkaplanrenkler[index],
                              border:
                                  Border.all(width: 0, color: Colors.white10),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: silmebutonuetkin,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screen.size.width / 3.1),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      size: widht / 20,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        notbasliklari.removeAt(index);
                                        noticerikleri.removeAt(index);
                                        veriEkle();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !silmebutonuetkin,
                                child: SizedBox(
                                  height: screen.size.height / 51,
                                ),
                              ),
                              Text(
                                notbasliklari[index],
                                style: TextStyle(
                                    fontSize: widht / 23, color: Colors.white),
                              ),
                              SizedBox(
                                height: screen.size.height / 50,
                              ),
                              Container(
                                width: screen.size.width / 3.5,
                                height: screen.size.height / 7,
                                child: Text(
                                  noticerikleri[index],
                                  style: TextStyle(
                                      fontSize: widht / 30,
                                      color: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            : Center(
                child: CupertinoButton(
                child: Text(
                  'Oturum aciniz',
                  style: TextStyle(color: Colors.black, fontSize: widht / 15),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ozelsayfa()));
                },
              )),
        floatingActionButton: Visibility(
          visible: oturum,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: widht / 20,
              ),
              backgroundColor: Colors.amber.shade300,
              onPressed: () {
                setState(() {
                  yeninoteklemekomudu = true;
                  silmebutonuetkin = false;
                });

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (cotext) => note()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
