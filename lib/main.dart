import 'package:flutter/material.dart';

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
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        actions: [
          SizedBox(width: 60),
          Expanded(
            child: TextField(
              cursorColor: Colors.white,
              controller: tf1,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              onChanged: (x) {
                setState(
                  () {
                    arama.clear();
                    Ulkeler.forEach(
                      (element) {
                        if (element.contains(tf1.text.toLowerCase())) {
                          (arama.contains(tf1.text))
                              ? null
                              : arama.add(element);
                        } else {
                          null;
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          tf1.text.isNotEmpty
              ? arama.length > 0
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: arama.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            title: Text(arama[index]),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          '  ${tf1.text}\nbulunamadi',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    )
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 5),
                    itemCount: Ulkeler.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(Ulkeler[index]),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}

var Ulkeler = [
  'turkiye',
  'almanya',
  'abd',
  'ingiltere',
  'fransa',
  'andorra',
  'andorra',
  'isveç',
  'isviçre',
  'italya',
  'kibris',
  'endonezya'
];
var tf1 = TextEditingController();
var arama = [];
