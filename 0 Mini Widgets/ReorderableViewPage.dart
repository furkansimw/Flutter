import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

List<String> fruits = [
  "apple",
  "watermelon",
  "Cherry",
  "Blackberry",
  "Orange",
  "peach",
  "banana"
];

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReorderableViewPage(),
    );
  }
}

class ReorderableViewPage extends StatefulWidget {
  @override
  _ReorderableViewPageState createState() => _ReorderableViewPageState();
}

class _ReorderableViewPageState extends State<ReorderableViewPage> {
  void sorting() {
    setState(() {
      fruits.sort(); //a-z
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Reorderable ListView In Flutter"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.sort_by_alpha),
              tooltip: "Sort",
              onPressed: sorting),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        child: ReorderableListView(
          padding: EdgeInsets.only(top: 12),
          children: <Widget>[
            for (final furit in fruits)
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: Colors.blueGrey,
                key: ValueKey(furit), //init
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Text(furit),
                ),
              ),
          ],
          onReorder: reorderData,
        ),
      ),
    );
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final nowFurit = fruits.removeAt(oldindex);

      fruits.insert(newindex, nowFurit);
    });
  }
}
