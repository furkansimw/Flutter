import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repository/data/getx.dart';
import 'package:repository/widgets/repoitem.dart';

import 'login.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final getx get = Get.find();
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Container(
      width: x,
      height: y,
      child: Column(
        children: [
          SizedBox(height: y * .1),
          Image.network(get.my['pp'] ?? pp),
          Text(get.my['username']),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: get.my['repo'].length,
              itemBuilder: (c, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: repoitem(get.my['repo'][i]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
