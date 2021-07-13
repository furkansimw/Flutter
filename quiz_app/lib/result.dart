import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Repositories.dart';
import 'package:quiz_app/createSeltQuestion.dart';
import 'package:quiz_app/main.dart';

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  _resultState createState() => _resultState();
}

var currentReplyNumber = 0;

class _resultState extends State<result> {
  @override
  void initState() {
    currentReplyNumber = 0;
    for (var x = 0; x < Repositories.questions.length; x++) {
      if (Repositories.questions[x].result == replies[x]) {
        setState(() {
          currentReplyNumber = currentReplyNumber + 1;
        });
      } else {
        null;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var title = TextStyle(fontSize: screen.width / 24, color: Colors.black);
    var content = TextStyle(fontSize: screen.width / 24, color: Colors.white);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Question id", style: title),
              Text("Your Reply", style: title),
              Text("Correct Reply", style: title),
              Text("Result ", style: title),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: Repositories.questions.length,
              itemExtent: 100,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Container(
                    child: Row(
                      children: [
                        Spacer(flex: 5),
                        Text(
                          "question: ${index + 1}",
                          style: content,
                        ),
                        Spacer(flex: 30),
                        Text("${replies[index]}", style: content),
                        Spacer(flex: 30),
                        Text("${Repositories.questions[index].result}",
                            style: content),
                        Spacer(flex: 30),
                        Text(
                            "${replies[index] == Repositories.questions[index].result}",
                            style: content),
                        Spacer(flex: 30),
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            replies[index] ==
                                    Repositories.questions[index].result
                                ? Colors.green
                                : Colors.red,
                            Colors.blue
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                );
              },
            ),
          ),
          Container(
            width: screen.width / 3,
            height: screen.height / 10,
            child: Center(
              child: Text(
                "${Repositories.questions.length}/$currentReplyNumber",
                style: TextStyle(
                    fontSize: 32,
                    color:
                        (Repositories.questions.length / currentReplyNumber == 1
                            ? Colors.green
                            : Colors.red)),
              ),
            ),
          ),
          CupertinoButton(
              child: Text("Rety"),
              onPressed: () {
                replies.clear();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => create()));
              }),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
