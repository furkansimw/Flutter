import 'package:flutter/material.dart';
import 'package:quiz_app/Repositories.dart';
import 'package:quiz_app/createSeltQuestion.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

var rep = 1;
var replies = [];
var questionId = 0;
var question = "";
var a = "";
var b = "";
var c = "";
var d = "";
var unSelected = Colors.white;
var selected = Colors.blueGrey;
var aColor = Colors.white;
var bColor = Colors.white;
var cColor = Colors.white;
var dColor = Colors.white;
var nextQuestionButtonV = false;

class _HomeState extends State<Home> {
  void all() {
    aColor = Colors.white;
    bColor = Colors.white;
    cColor = Colors.white;
    dColor = Colors.white;
  }

  @override
  void initState() {
    setState(() {
      var repositories = Repositories();
      repositories.start();
      work();
    });
    super.initState();
  }

  void work() {
    setState(() {
      question = Repositories.questions[questionId].question;
      a = Repositories.questions[questionId].a;
      b = Repositories.questions[questionId].b;
      c = Repositories.questions[questionId].c;
      d = Repositories.questions[questionId].d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: Text(" Question: ${questionId + 1}"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => create()));
              },
              icon: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: Container(
              width: 400,
              height: 350,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text("$question", style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 450,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          all();
                          nextQuestionButtonV = true;
                          aColor = selected;
                          rep = 1;
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 125,
                        color: aColor,
                        child: Center(
                            child: Text("$a", style: TextStyle(fontSize: 28))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          all();
                          bColor = selected;
                          nextQuestionButtonV = true;
                          rep = 2;
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 125,
                        color: bColor,
                        child: Center(
                            child: Text("$b", style: TextStyle(fontSize: 28))),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          all();
                          cColor = selected;
                          nextQuestionButtonV = true;
                          rep = 3;
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 125,
                        color: cColor,
                        child: Center(
                            child: Text("$c", style: TextStyle(fontSize: 28))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          all();
                          dColor = selected;
                          nextQuestionButtonV = true;
                          rep = 4;
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 125,
                        color: dColor,
                        child: Center(
                            child: Text("$d", style: TextStyle(fontSize: 28))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Visibility(
            visible: nextQuestionButtonV,
            child: GestureDetector(
              onTap: () {
                replies.add(rep);
                setState(() {
                  if (questionId + 1 == Repositories.questions.length) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => result()));
                  }
                  questionId += 1;
                  all();
                  nextQuestionButtonV = false;
                  work();
                });
              },
              child: Container(
                color: Colors.green,
                width: 150,
                height: 70,
                child: Center(
                    child:
                        Text("Next Question", style: TextStyle(fontSize: 20))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
