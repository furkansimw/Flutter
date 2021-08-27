import 'package:flutter/material.dart';

void main() => runApp(app());

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class animationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        xd
            ? {controller.reverse(), xd = false}
            : {controller.forward(), xd = true};
      },
      child: Container(
        width: animation.value,
        height: animation.value,
        color: Colors.blue,
        child: Center(child: Text(animation.value.toInt().toString())),
      ),
    );
  }
}

late AnimationController controller;
late Animation animation;
bool xd = false;

///TickerProviderStateMixin for vsync:hz
class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 150.0, end: 250.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            animationContainer(),
          ],
        ),
      ),
    );
  }
}
