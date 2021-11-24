import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repository/data/data.dart';
import 'package:repository/data/getx.dart';
import 'package:repository/screens/home.dart';
import 'package:repository/screens/profile.dart';
import 'package:repository/screens/search.dart';

class core extends StatefulWidget {
  @override
  State<core> createState() => _coreState();
}

class _coreState extends State<core> {
  final getx get = Get.put(getx());
  @override
  void initState() {
    listenSelf();
  }

  void listenSelf() {
    var selfemail = FirebaseAuth.instance.currentUser!.email!;
    fire.collection('users').doc(selfemail).snapshots().listen((event) {
      get.my.value = event.data()!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[pageIndex],
      ),
    );
  }
}

List<Widget> pages = [
  home(),
  search(),
  profile(),
];

int pageIndex = 0;
