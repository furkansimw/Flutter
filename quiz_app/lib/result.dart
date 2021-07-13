import 'package:flutter/material.dart';
import 'package:quiz_app/Repositories.dart';
import 'package:quiz_app/main.dart';

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  _resultState createState() => _resultState();
}

var title = TextStyle(fontSize: 25, color: Colors.black);
var content = TextStyle(fontSize: 20, color: Colors.white);
var correntReplyNumber = 0;

class _resultState extends State<result> {
  @override
  void initState() {
    for (var x = 0; x < Repositories.questions.length; x++) {
      if (Repositories.questions[x].result == replies[x]) {
        setState(() {
          correntReplyNumber = correntReplyNumber + 1;
        });
      } else {
        null;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Your Reply", style: title),
              Text("Correct Reply", style: title),
              Text("Result ", style: title),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: replies.length,
              itemExtent: 100,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${replies[index]}", style: content),
                        Text("${Repositories.questions[index].result}",
                            style: content),
                        Text(
                            "${replies[index] == Repositories.questions[index].result}",
                            style: content),
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.green, Colors.blue],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                );
              },
            ),
          ),
          Container(
            width: 300,
            height: 150,
            child: Center(
              child: Text(
                "${Repositories.questions.length}/$correntReplyNumber",
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
