import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

const grey = Color(0xffA5A5A5);
const orange = Color(0xffFF9601);
const black = Color(0xff000000);
const dgrey = Color(0xff333333);
const white = Color(0xffffffff);
double number1 = 0;
double number2 = 0;
double result = 0;
var procces = "null";
var isDouble = false;

class app extends StatelessWidget {
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
    void workStation(var number) {
      setState(() {
        switch (number) {
          case "AC":
            number1 = 0;
            number2 = 0;
            result = 0;
            isDouble = false;
            procces = "";
            break;
          case "+/-":
            number1 = (number1 * -1);
            result = number1;
            break;
          case "%":
            break;
          case "÷":
            number2 = number1;
            procces = "÷";
            number1 = 0;
            break;
          case "+":
            number2 = number1;
            procces = "+";
            number1 = 0;
            break;
          case "=":
            //result
            if (procces == "÷") {
              result = number2 / number1;
            }
            if (procces == "+") {
              result = number1 + number2;
              number1 = result;
            }
            if (procces == "÷") {
              result = number2 / number1;
              number1 = result;
              isDouble = true;
              String resultStringType = result.toString();
              if (resultStringType.contains(".0")) {
                isDouble = false;
              }
            }
            break;
          case ".":
            procces = ".";
            isDouble = true;
            break;

          default:
            if (procces == ".") {
              number1 = number1 + (number / 10);
              procces = "";
              result = number1;
            } else {
              number1 = (number1 * 10) + number;
              result = number1;
            }

            break;
        }
      });
    }

    var x = MediaQuery.of(context).size.width;
    var y = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (number1 > 9) {
                  isDouble = false;
                  number1 = number1 / 10;
                  result = number1;
                } else {
                  number1 = 0;
                  result = number1;
                }
              });
            },
            child: Container(
              color: Colors.black,
              width: x,
              height: y * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "$number1",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text("$number2", style: TextStyle(color: Colors.white)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        isDouble
                            ? SizedBox(
                                width: x * 0.8,
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${result} ",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 95,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: x * 0.8,
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${result.toInt()} ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 95,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: y * 0.65,
            width: x,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(x, y, "AC", () => workStation("AC"),
                        backgroundcolor: 2),
                    button(x, y, "+/-", () => workStation("+/-"),
                        backgroundcolor: 2),
                    button(x, y, "%", () => workStation("%"),
                        backgroundcolor: 2),
                    button(x, y, "÷", () => workStation("÷"),
                        backgroundcolor: 3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(x, y, "7", () => workStation(7), backgroundcolor: 1),
                    button(x, y, "8", () => workStation(8), backgroundcolor: 1),
                    button(x, y, "9", () => workStation(9), backgroundcolor: 1),
                    button(x, y, "x", () => workStation("x"),
                        backgroundcolor: 3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(x, y, "4", () => workStation(4), backgroundcolor: 1),
                    button(x, y, "5", () => workStation(5), backgroundcolor: 1),
                    button(x, y, "6", () => workStation(6), backgroundcolor: 1),
                    button(x, y, "-", () => workStation("-"),
                        backgroundcolor: 3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(x, y, "1", () => workStation(1), backgroundcolor: 1),
                    button(x, y, "2", () => workStation(2), backgroundcolor: 1),
                    button(x, y, "3", () => workStation(3), backgroundcolor: 1),
                    button(x, y, "+", () => workStation("+"),
                        backgroundcolor: 3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(x, y, "0", () => workStation(0), backgroundcolor: 1),
                    button(x, y, ".", () => workStation("."),
                        backgroundcolor: 1),
                    button(x, y, "=", () => workStation("="),
                        backgroundcolor: 3),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class button extends StatelessWidget {
  double x = 1, y = 1;
  var number;
  int backgroundcolor; //1= dgrey  2= grey  3= orange
  var func;
  button(this.x, this.y, this.number, this.func, {this.backgroundcolor = 1});

  //textstyle

  //widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: number == "0"
          ? x * 0.43
          : x * 0.19, // 168 - 70px (392px)    42%  -  17,8%
      height: y * 0.095, //70px (791px)  8,8%

      child: MaterialButton(
        onPressed: func,
        color: backgroundcolor == 1
            ? dgrey
            : backgroundcolor == 2
                ? grey
                : orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: number != "0"
            ? Center(
                child: Text("$number",
                    style: number == "AC" || number == "+/-" || number == "%"
                        ? TextStyle(
                            fontSize: 29,
                            color: backgroundcolor == 2 ? Colors.black : white)
                        : TextStyle(
                            fontSize: 38,
                            color: backgroundcolor == 2 ? Colors.black : white,
                            fontWeight: FontWeight.w400)))
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(" $number",
                      style: TextStyle(
                          fontSize: 38,
                          color: white,
                          fontWeight: FontWeight.w400)),
                ],
              ),
      ),
    );
  }
}
