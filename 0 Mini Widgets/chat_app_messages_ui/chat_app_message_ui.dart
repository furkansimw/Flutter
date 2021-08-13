import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 60, top: 100),
              child: Text(
                "Messages",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 574,
            child: ListView.builder(
              itemCount: peoples.length,
              itemExtent: 100,
              itemBuilder: (_, index) {
                return peoples[index];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        currentIndex: value,
        onTap: (x) {
          setState(() {
            value = x;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 25,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 25,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 25,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 25,
            ),
            title: Text(""),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 10, bottom: 5),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue[900],
          child: Icon(Icons.add, size: 25),
        ),
      ),
    );
  }
}

var value = 0;
var peoples = [
  card(
    "Jontahan Perry",
    "Nulla pellentesque dignissim enim sit amet venenatis",
    "19:53",
    newM: 12,
    online: true,
    ppColor: Colors.grey,
  ),
  card(
    "Class B1",
    "Nulla pellentesque dignissim enim sit amet venenatis",
    "12:43",
    online: true,
    ppColor: Colors.purple,
  ),
  card(
    "Joseph Burns",
    "Nulla pellentesque dignissim enim sit amet venenatis",
    "05:23",
    newM: 2,
    ppColor: Colors.blue,
  ),
  card(
    "Samantha White",
    "Nulla pellentesque dignissim enim sit amet venenatis",
    "12:43",
    online: true,
  ),
  card(
    "Weekend Trip",
    "Nulla pellentesque dignissim enim sit amet venenatis",
    "15:13",
    ppColor: Colors.amber,
  ),
  card(
    "Furkan Simsek",
    "Nulla pellentesque dignissim enim sit amet venenatis",
    "01:41",
    newM: 6,
    online: true,
  ),
];

class card extends StatelessWidget {
  var name, abaout;
  var hour = "12:45";
  var newM = 2;
  var online;
  var ppColor;
  card(this.name, this.abaout, this.hour,
      {this.newM = 0, this.online = false, this.ppColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      width: 75,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: ppColor,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: online,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 6,
                        child: CircleAvatar(
                          backgroundColor: Colors.green.shade400,
                          maxRadius: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Container(
                width: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        "$abaout",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                children: [
                  Text(
                    "$hour",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    visible: newM != 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "$newM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
