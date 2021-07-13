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
      home: create(),
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
void all() {
  aColor = Colors.white;
  bColor = Colors.white;
  cColor = Colors.white;
  dColor = Colors.white;
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    setState(() {
      replies.clear();
      work();
    });
    super.initState();
  }

  void work() {
    setState(() {
      questionId = 0;
      question = Repositories.questions[questionId].question;
      a = Repositories.questions[questionId].a;
      b = Repositories.questions[questionId].b;
      c = Repositories.questions[questionId].c;
      d = Repositories.questions[questionId].d;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: Text(" Question: ${questionId + 1}"),
      ),
      body: Column(
        children: [
          SizedBox(height: screen.height / 20),
          Center(
            child: Container(
              width: screen.width / 1.2,
              height: screen.height / 3,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screen.height / 15),
                    child: Text("$question",
                        style: TextStyle(fontSize: screen.width / 12)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screen.height / 30),
          Container(
            width: screen.width / 1.1,
            height: screen.height / 3.1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(aColor, screen, () {
                      setState(() {
                        all();
                        rep = 1;
                        aColor = selected;
                        nextQuestionButtonV = true;
                      });
                    }),
                    button(bColor, screen, () {
                      setState(() {
                        all();
                        rep = 2;
                        bColor = selected;
                        nextQuestionButtonV = true;
                      });
                    })
                  ],
                ),
                SizedBox(height: screen.height / 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(cColor, screen, () {
                      setState(() {
                        all();
                        rep = 3;
                        cColor = selected;
                        nextQuestionButtonV = true;
                      });
                    }),
                    button(dColor, screen, () {
                      setState(() {
                        all();
                        rep = 4;
                        dColor = selected;
                        nextQuestionButtonV = true;
                      });
                    })
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screen.height / 50),
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
                width: screen.width / 2.8,
                height: screen.height / 9.5,
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

class button extends StatefulWidget {
  var selectedColorCache = Colors.white;

  var xscreen;
  VoidCallback func;
  button(this.selectedColorCache, this.xscreen, this.func);
  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.func,
      child: Container(
        decoration: BoxDecoration(
            color: widget.selectedColorCache,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: widget.xscreen.width / 2.5,
        height: widget.xscreen.height / 7,
        child: Center(
            child: Text("$d",
                style: TextStyle(fontSize: widget.xscreen.width / 16))),
      ),
    );
  }
}
