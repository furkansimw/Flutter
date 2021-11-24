import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

FirebaseFirestore fire = FirebaseFirestore.instance;

void toast(String msg) {
  Fluttertoast.showToast(msg: msg);
}
