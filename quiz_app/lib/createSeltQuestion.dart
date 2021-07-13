import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/Quesion.dart';
import 'package:quiz_app/Repositories.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/result.dart';

class create extends StatefulWidget {
  const create({Key? key}) : super(key: key);

  @override
  _createState createState() => _createState();
}

double cardNumber = 1;
bool _questions = false;
var insertNumber = TextEditingController();

class _createState extends State<create> {
  @override
  void initState() {
    setState(() {
      var x = Repositories();
      x.start();
      cardNumber = Repositories.questions.length.toDouble();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "${cardNumber.toInt()}",
              style: TextStyle(fontSize: 22),
            ),
            Visibility(
              visible: _questions,
              child: Container(
                height: 250,
                child: Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: cardNumber.toInt(),
                    itemExtent: 200,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              questionEdit.text =
                                  Repositories.questions[index].question;
                              edit1.text = Repositories.questions[index].a;
                              edit2.text = Repositories.questions[index].b;
                              edit3.text = Repositories.questions[index].c;
                              edit4.text = Repositories.questions[index].d;
                              cacheReply = Repositories.questions[index].result;
                              insertNumber.text = (index + 1).toString();
                            });
                          },
                          child: Card(
                            color: Colors.red,
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Repositories.questions.removeAt(index);
                                        cardNumber = Repositories
                                            .questions.length
                                            .toDouble();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                                Text(
                                  Repositories.questions[index].question,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Spacer(flex: 10),
                                Text(
                                  "1: ${Repositories.questions[index].a}",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Spacer(flex: 10),
                                Text("2: ${Repositories.questions[index].b}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                Spacer(flex: 10),
                                Text("3: ${Repositories.questions[index].c}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                Spacer(flex: 10),
                                Text("4: ${Repositories.questions[index].d}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                Spacer(flex: 10),
                                Text(
                                    "correct :${Repositories.questions[index].result.toString()}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue)),
                                Spacer(flex: 20),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (!_questions) {
                      message("questions show", fontsize: 15);
                    } else {
                      message("questions hide", fontsize: 15);
                    }
                    _questions = !_questions;
                  });
                },
                icon: Icon(
                    _questions ? Icons.arrow_upward : Icons.arrow_downward)),
            SizedBox(height: 25),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: 400,
                height: 450,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CupertinoTextField(
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                controller: insertNumber,
                                style: TextStyle(fontSize: 30)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: questionEdit,
                        onChanged: (x) {},
                        decoration: InputDecoration(
                            hintText: "Question=",
                            hintStyle: TextStyle(color: Colors.white38)),
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: TextField(
                              controller: edit1,
                              onChanged: (x) {},
                              decoration: InputDecoration(
                                  hintText: "1=",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: SizedBox(
                            width: 180,
                            child: TextField(
                              controller: edit2,
                              onChanged: (x) {},
                              decoration: InputDecoration(
                                  hintText: "2=",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: TextField(
                              controller: edit3,
                              onChanged: (x) {},
                              decoration: InputDecoration(
                                  hintText: "3=",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: SizedBox(
                            width: 180,
                            child: TextField(
                              controller: edit4,
                              onChanged: (x) {},
                              decoration: InputDecoration(
                                  hintText: "4=",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (cacheReply == 4) {
                            cacheReply = 1;
                          } else {
                            cacheReply += 1;
                          }
                        });
                      },
                      child: Text(
                        "corret reply: $cacheReply",
                        style: content,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (questionEdit.text.isNotEmpty &&
                                edit1.text.isNotEmpty &&
                                edit2.text.isNotEmpty &&
                                edit3.text.isNotEmpty &&
                                edit4.text.isNotEmpty) {
                              if (insertNumber.text.isEmpty) {
                                Repositories.questions.add(Question(
                                    insertNumber.text,
                                    questionEdit.text,
                                    edit1.text,
                                    edit2.text,
                                    edit3.text,
                                    edit4.text,
                                    cacheReply));
                              } else {
                                Repositories.questions.insert(
                                    int.parse(insertNumber.text) - 1,
                                    Question(
                                        insertNumber.text,
                                        questionEdit.text,
                                        edit1.text,
                                        edit2.text,
                                        edit3.text,
                                        edit4.text,
                                        cacheReply));
                              }
                            } else {
                              message("any some place");
                            }
                            cardNumber =
                                Repositories.questions.length.toDouble();
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void message(String message, {int fontsize: 18}) {
  Fluttertoast.showToast(
      msg: "$message",
      backgroundColor: Colors.white,
      fontSize: fontsize.toDouble(),
      textColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG);
}

var questionEdit = TextEditingController();
var edit1 = TextEditingController();
var edit2 = TextEditingController();
var edit3 = TextEditingController();
var edit4 = TextEditingController();

int cacheReply = 1;
