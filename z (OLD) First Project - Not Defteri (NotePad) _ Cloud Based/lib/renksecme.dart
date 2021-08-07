import 'package:flutter/material.dart';

import 'main.dart';

class renksecmeler extends StatefulWidget {
  @override
  _renksecmelerState createState() => _renksecmelerState();
}

var temarenkleri = [
  Colors.deepOrangeAccent,
  Colors.orangeAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.redAccent,
  Colors.blue,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.amber,
  Colors.teal,
  Colors.indigoAccent,
  Colors.lightBlueAccent
];

class _renksecmelerState extends State<renksecmeler> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(Icons.color_lens_outlined, color: Colors.white, size: 40),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Center(
                    child: Text(
                  "Tema Renkleri",
                  style: TextStyle(color: Colors.black),
                )),
                enabled: false,
              ),
              PopupMenuItem(
                value: 1,
                child: Center(
                    child: Icon(Icons.color_lens_outlined,
                        color: Colors.deepOrangeAccent, size: 40)),
              ),
              PopupMenuItem(
                value: 2,
                child: Center(
                    child: Icon(Icons.color_lens_outlined,
                        color: Colors.orangeAccent, size: 40)),
              ),
              PopupMenuItem(
                value: 3,
                child: Center(
                    child: Icon(Icons.color_lens_outlined,
                        color: Colors.pinkAccent, size: 40)),
              ),
              PopupMenuItem(
                value: 4,
                child: Center(
                    child: Icon(Icons.color_lens_outlined,
                        color: Colors.purpleAccent, size: 40)),
              ),
              PopupMenuItem(
                value: 5,
                child: Center(
                    child: Icon(Icons.color_lens_outlined,
                        color: Colors.redAccent, size: 40)),
              ),
              PopupMenuItem(
                value: 6,
                child: Center(
                  child: Icon(
                    Icons.color_lens_outlined,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 7,
                child: Center(
                  child: Icon(
                    Icons.color_lens_outlined,
                    color: Colors.greenAccent,
                    size: 40,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 8,
                child: Center(
                  child: Icon(
                    Icons.color_lens_outlined,
                    color: Colors.amber,
                    size: 40,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 9,
                child: Center(
                  child: Icon(
                    Icons.color_lens_outlined,
                    color: Colors.teal,
                    size: 40,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 10,
                child: Center(
                  child: Icon(
                    Icons.color_lens_outlined,
                    color: Colors.indigoAccent,
                    size: 40,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 11,
                child: Center(
                  child: Icon(
                    Icons.color_lens_outlined,
                    color: Colors.lightBlueAccent,
                    size: 40,
                  ),
                ),
              ),
            ],
        onSelected: (x) {
          setState(() {
            if (x == 1) {
              setState(() {
                arkaplanrenkler[indeks] = Colors.deepOrangeAccent;
                renk = arkaplanrenkler[indeks];
              });
            }
            if (x == 2) {
              setState(() {
                arkaplanrenkler[indeks] = Colors.orangeAccent;
                renk = arkaplanrenkler[indeks];
              });
            }
          });
          if (x == 3) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.pinkAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
          if (x == 4) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.purpleAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
          if (x == 5) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.redAccent;
              renk = arkaplanrenkler[indeks];
            });
          }

          if (x == 6) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.blueAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
          if (x == 7) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.greenAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
          if (x == 8) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.amberAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
          if (x == 9) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.tealAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
          if (x == 10) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.indigoAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
          if (x == 11) {
            setState(() {
              arkaplanrenkler[indeks] = Colors.lightBlueAccent;
              renk = arkaplanrenkler[indeks];
            });
          }
        });
  }
}

var arkaplanrenkler = [
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
  Colors.lightBlueAccent,
];
