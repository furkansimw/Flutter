import 'dart:convert';
import 'package:packagename/models/modelclassname.dart'; //!!!!
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  x() async {
    var data =
        await DefaultAssetBundle.of(context).loadString('data/data.json');
    return json.decode(data);
  }

  List liste = [];
  Future<http.Response> veriIsleme() async {
    Response respose = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users')); //main api page
    return respose;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [
          RaisedButton(
            onPressed: () async {
              Response nowData = await veriIsleme();
              List<classname> liste = [];

              //nowData.body this string to object
              json.decode(nowData.body).forEach((element) {
                liste.add(classname.fromJson(element));
              });

              liste.forEach((element) {
                print(element.toString()); // class props
              });
            },
          ),
        ],
      ),
    );
  }
}

//go https://javiercbk.github.io/json_to_dart/
// example object convert must ? 
//main https://jsonplaceholder.typicode.com/

//http: ^0.13.4