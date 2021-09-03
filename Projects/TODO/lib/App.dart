//https://github.com/Furkans0778/Flutter
//Furkan Simsek
import 'package:flutter/material.dart';

List todo = [todoTemp("Welcome", false)];

class todoTemp {
  String text;
  bool box;
  bool isEdit = false;

  todoTemp(this.text, this.box, {this.isEdit = false});
}

var textFiled = TextEditingController();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    var spacer = SizedBox(width: x * 0.075);
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 1,
        title: Text("TO DO"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ReorderableListView(
                padding: EdgeInsets.only(top: 12),
                children: <Widget>[
                  for (final note in todo)
                    note.box
                        //true
                        //if box true?
                        //dissmissible parent
                        ? Dismissible(
                            key: Key(note.text),
                            onDismissed: (direction) {
                              todo.remove(note);
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.white,
                              key: ValueKey(note), //init
                              child: Row(
                                children: [
                                  spacer,
                                  Container(
                                    width: x * 0.55, // %55
                                    child: note.isEdit
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextField(
                                                  controller: textFiled,
                                                  autofocus: true,
                                                  style: TextStyle(
                                                      fontSize: x * 0.055)),
                                            ],
                                          )
                                        : Text(
                                            note.text,
                                            style: TextStyle(
                                              fontSize: x * 0.07, // %7
                                              decoration: note.box
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                              fontStyle: note.box
                                                  ? FontStyle.italic
                                                  : FontStyle.normal,
                                            ),
                                          ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    child: note.isEdit
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                note.isEdit = false;
                                                note.text = textFiled.text;
                                              });
                                            },
                                            icon: Icon(Icons.play_arrow,
                                                size: x * 0.09,
                                                color: Colors.blue))
                                        : Checkbox(
                                            value: note.box,
                                            onChanged: (x) {
                                              setState(() {
                                                note.box = x!;
                                              });
                                            }),
                                  ),
                                  spacer,
                                ],
                              ),
                            ),
                          )
                        //false
                        : Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            color: Colors.white,
                            key: ValueKey(note), //init
                            child: Row(
                              children: [
                                spacer,
                                Container(
                                  width: x * 0.55, // %55
                                  child: note.isEdit
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextField(
                                                controller: textFiled,
                                                autofocus: true,
                                                style: TextStyle(
                                                    fontSize: x * 0.055)),
                                          ],
                                        )
                                      : Text(
                                          note.text,
                                          style: TextStyle(
                                            fontSize: x * 0.07, // %7
                                            decoration: note.box
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            fontStyle: note.box
                                                ? FontStyle.italic
                                                : FontStyle.normal,
                                          ),
                                        ),
                                ),
                                Spacer(),
                                SizedBox(
                                  child: note.isEdit
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              note.isEdit = false;
                                              note.text = textFiled.text;
                                              textFiled.text = "";
                                            });
                                          },
                                          icon: Icon(Icons.play_arrow,
                                              size: x * 0.09,
                                              color: Colors.blue))
                                      : Checkbox(
                                          value: note.box,
                                          onChanged: (x) {
                                            setState(() {
                                              note.box = x!;
                                            });
                                          }),
                                ),
                                spacer,
                              ],
                            ),
                          ),
                ],
                onReorder: reorderData,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(15),
        child: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: () {
              setState(() {
                todo.add(todoTemp("", false, isEdit: true));
                textFiled.text = "";
              });
            }),
      ),
    );
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final nowObject = todo.removeAt(oldindex);
      todo.insert(newindex, nowObject);
    });
  }
}
