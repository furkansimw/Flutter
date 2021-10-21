import 'package:flutter/material.dart';

class core extends StatefulWidget {
  @override
  _coreState createState() => _coreState();
}

class _coreState extends State<core> {
  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    var y = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: x,
                child: Column(
                  children: [],
                ),
              ),
            ),
            Container(
              height: y * .1,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bottomNavigatorButton(() => set(1), Icons.home, 1),
                  bottomNavigatorButton(() => set(2), Icons.search, 2),
                  bottomNavigatorButton(() => set(3), Icons.favorite, 3),
                  bottomNavigatorButton(() => set(4), Icons.person, 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void set(newI) {
    setState(() {
      selected = newI;
    });
  }
}

int selected = 1;

class bottomNavigatorButton extends StatelessWidget {
  var func, icon, index;
  bottomNavigatorButton(this.func, this.icon, this.index);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: func,
      icon: Icon(
        icon,
        size: 28,
        color: selected == index ? Colors.white : Colors.white.withOpacity(.75),
      ),
    );
  }
}
