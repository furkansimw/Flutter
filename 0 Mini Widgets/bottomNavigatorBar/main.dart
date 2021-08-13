import 'package:flutter/material.dart';

void main() => runApp(app());

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
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
        title: Text("title"),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  void work(var number) {
    setState(() {
      reset();
      itemx[number - 1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            items(Colors.purple, Icons.home_outlined, "Home", itemx[0],
                () => work(1)),
            items(Colors.pink, Icons.favorite_border, "Favori", itemx[1],
                () => work(2)),
            items(Colors.amber, Icons.search_outlined, "Search", itemx[2],
                () => work(3)),
            items(Colors.lightBlue, Icons.person_outline_outlined, "Person",
                itemx[3], () => work(4)),
          ],
        ),
      ),
    );
  }
}

class items extends StatelessWidget {
  var color, icon, text, isSelected, islem;

  items(this.color, this.icon, this.text, this.isSelected, this.islem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: islem,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: isSelected ? 100 : 40,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? color[300] : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(35),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color[900]),
            isSelected
                ? Text(text, style: TextStyle(color: color[900]))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

var itemx = [true, false, false, false];

void reset() {
  itemx[0] = false;
  itemx[1] = false;
  itemx[2] = false;
  itemx[3] = false;
}
