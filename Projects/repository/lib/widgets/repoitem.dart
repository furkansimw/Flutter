import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repository/data/data.dart';
import 'package:repository/data/getx.dart';

class repoitem extends StatefulWidget {
  var x, y, url;
  repoitem(this.x, this.y, this.url);
  @override
  State<repoitem> createState() => _repoitemState();
}

class _repoitemState extends State<repoitem> {
  var data;
  @override
  void initState() {
    fire.collection('repos').doc(widget.url).get().then((value) {
      data = value.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.x,
      height: widget.y * .1,
      child: Row(
        children: [],
      ),
    );
  }
}
